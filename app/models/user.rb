class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :sns_credentials, dependent: :destroy
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_many :credits
  has_many :products
  has_many :cards
  # validates :email, presence: true
  # validates :encrypted_password, presence: true
  #                                length: { minimum: 6}
  # validates :reset_password_token, presence: true
  # validates :reset_password_sent_at, presence: true
  # validates :remember_created_at, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :first_name_kata, presence: true
  # validates :last_name_kata, presence: true
  # validates :nickname, presence: true
  # validates :post_code, presence: true
  # validates :prefecture, presence: true
  # validates :city_village_town, presence: true
  # validates :house_number, presence: true

  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
    end

   def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
   end

   def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end


end


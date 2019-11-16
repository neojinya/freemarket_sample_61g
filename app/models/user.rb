class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :credits
  has_many :products
  has_many :cards

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true, length: { minimum: 7}
  # validates :reset_password_token, presence: true
  # validates :reset_password_sent_at, presence: true
  # validates :remember_created_at, presence: true
  validates :phone_number, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kata, presence: true
  validates :last_name_kata, presence: true
  validates :nickname, presence: true
  validates :post_code, presence: true
  validates :prefecture, presence: true
  validates :city_village_town, presence: true
  validates :house_number, presence: true

end


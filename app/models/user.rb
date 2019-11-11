class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :credits
  has_many :products
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
end


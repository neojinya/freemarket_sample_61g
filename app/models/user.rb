class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :products
  has_many :cards

  validates :nickname,           presence: true, uniqueness: true
  validates :email,              presence: true, uniqueness: true
  validates :encrypted_password, presence: true, length: { minimum: 7}
  validates :phone_number,       presence: true, numericality: true
  validates :first_name,         presence: true
  validates :last_name,          presence: true
  validates :first_name_kata,    presence: true
  validates :last_name_kata,     presence: true
  validates :post_code,          presence: true, numericality: true
  validates :prefecture,         presence: true
  validates :city_village_town,  presence: true
  validates :house_number,       presence: true

end


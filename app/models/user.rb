class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }
  GENDER = ["Homme", "Femme"]

  has_one_attached :photo
  has_many :restaurants
end

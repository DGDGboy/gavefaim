class Restaurant < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  has_many :reviews, dependent: :destroy
  has_many_attached :images
  belongs_to :user
end

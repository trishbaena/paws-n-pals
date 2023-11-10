class Outfit < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy

  has_one_attached :photo
  # validates :photo_url, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end

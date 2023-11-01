class Outfit < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy

  validates :photo_url, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end

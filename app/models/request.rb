class Request < ApplicationRecord
  belongs_to :user
  belongs_to :outfit

  validates :status, inclusion: { in: ["Pending", "Rejected", "Accepted"] }
end

class Request < ApplicationRecord
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status = 'Pending'
  end

  belongs_to :user
  belongs_to :outfit

  validates :status, inclusion: { in: ["Pending", "Rejected", "Accepted"] }

end

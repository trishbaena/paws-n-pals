class AddEndDateToRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :requests, :end_date, :date
  end
end

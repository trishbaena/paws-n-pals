class AddStartDateToRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :requests, :start_date, :date
  end
end

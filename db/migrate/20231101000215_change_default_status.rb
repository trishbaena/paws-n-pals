class ChangeDefaultStatus < ActiveRecord::Migration[7.1]
  def change
    change_column_default :requests, :status, from: nil, to: 'Pending'
  end
end

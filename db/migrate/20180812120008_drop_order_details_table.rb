class DropOrderDetailsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :order_details
  end
end

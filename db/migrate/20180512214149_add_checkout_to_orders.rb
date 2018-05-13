class AddCheckoutToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :checkout, :boolean, :default => false
  end
end

class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :products, :price, 0
  end
end

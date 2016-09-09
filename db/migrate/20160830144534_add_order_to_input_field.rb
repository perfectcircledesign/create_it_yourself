class AddOrderToInputField < ActiveRecord::Migration[5.0]
  def change
    add_column :input_fields, :order, :int
  end
end

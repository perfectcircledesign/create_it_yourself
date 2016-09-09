class AddOrderToDivision < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :order, :integer
  end
end

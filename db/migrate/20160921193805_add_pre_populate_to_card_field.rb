class AddPrePopulateToCardField < ActiveRecord::Migration[5.0]
  def change
    add_column :card_fields, :pre_populate, :string
  end
end

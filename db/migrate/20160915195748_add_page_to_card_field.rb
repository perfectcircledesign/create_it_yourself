class AddPageToCardField < ActiveRecord::Migration[5.0]
  def change
    add_column :card_fields, :page, :integer
  end
end

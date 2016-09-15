class CreateCardFields < ActiveRecord::Migration[5.0]
  def change
    create_table :card_fields do |t|
      t.string :name
      t.string :function
      t.float :x_pos
      t.float :y_pos
      t.integer :font_id
      t.string :size
      t.string :colour
      t.string :weight
      t.string :align
      t.string :prefix
      t.string :default
      t.integer :order

      t.timestamps
    end
  end
end

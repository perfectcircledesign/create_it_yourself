class CreateCrewCardFields < ActiveRecord::Migration[5.0]
  def change
    create_table :crew_card_fields do |t|
      t.string :name
      t.float :x_pos
      t.float :y_pos
      t.string :size
      t.string :colour
      t.string :weight
      t.string :align
      t.integer :font_id
      t.string :prefix
      t.string :default
      t.integer :order

      t.timestamps
    end
  end
end

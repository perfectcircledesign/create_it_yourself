class CreateInputFields < ActiveRecord::Migration[5.0]
  def change
    create_table :input_fields do |t|
      t.float :x_pos
      t.float :y_pos
      t.string :font
      t.string :size
      t.string :colour
      t.string :weight
      t.string :align

      t.timestamps
    end
  end
end

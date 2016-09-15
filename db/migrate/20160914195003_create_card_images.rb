class CreateCardImages < ActiveRecord::Migration[5.0]
  def change
    create_table :card_images do |t|
      t.float :x_pos
      t.float :y_pos
      t.integer :x_size
      t.integer :y_size
      t.string :function
      t.integer :page
      t.integer :division_id

      t.timestamps
    end
  end
end

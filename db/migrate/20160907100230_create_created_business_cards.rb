class CreateCreatedBusinessCards < ActiveRecord::Migration[5.0]
  def change
    create_table :created_business_cards do |t|
      t.string :holder_name
      t.string :holder_name2
      t.string :company
      t.string :division

      t.timestamps
    end
  end
end

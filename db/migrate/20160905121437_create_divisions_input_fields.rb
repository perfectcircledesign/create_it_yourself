class CreateDivisionsInputFields < ActiveRecord::Migration[5.0]
  def change
    create_table :divisions_input_fields, id: false do |t|
      t.integer :division_id, null: false
      t.integer :input_field_id, null: false
    end
  end
end


class AddFieldNameToInputFields < ActiveRecord::Migration[5.0]
  def change
    add_column :input_fields, :field_name, :string
  end
end

class AddDefaultToInputField < ActiveRecord::Migration[5.0]
  def change
    add_column :input_fields, :default, :string
  end
end

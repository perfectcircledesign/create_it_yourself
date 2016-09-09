class AddPrefixToInputField < ActiveRecord::Migration[5.0]
  def change
    add_column :input_fields, :prefix, :string
  end
end

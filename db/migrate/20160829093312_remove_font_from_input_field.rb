class RemoveFontFromInputField < ActiveRecord::Migration[5.0]
  def change
    remove_column :input_fields, :font, :string
  end
end

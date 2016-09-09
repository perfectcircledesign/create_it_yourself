class AddFontIdToInputField < ActiveRecord::Migration[5.0]
  def change
    add_column :input_fields, :font_id, :integer
  end
end

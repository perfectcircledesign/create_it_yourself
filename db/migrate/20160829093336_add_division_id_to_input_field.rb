class AddDivisionIdToInputField < ActiveRecord::Migration[5.0]
  def change
    add_column :input_fields, :division_id, :integer
  end
end

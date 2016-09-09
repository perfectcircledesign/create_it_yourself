class RemoveDivisionIdFromInputFields < ActiveRecord::Migration[5.0]
  def change
  	remove_column :input_fields, :division_id
  end
end

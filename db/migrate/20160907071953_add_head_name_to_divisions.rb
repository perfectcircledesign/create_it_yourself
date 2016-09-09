class AddHeadNameToDivisions < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :head_name, :string
  end
end

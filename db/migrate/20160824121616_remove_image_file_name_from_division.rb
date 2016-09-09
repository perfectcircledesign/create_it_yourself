class RemoveImageFileNameFromDivision < ActiveRecord::Migration[5.0]
  def change
    remove_column :divisions, :image_file_name, :string
  end
end

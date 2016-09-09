class RemoveImageContentTypeFromDivision < ActiveRecord::Migration[5.0]
  def change
    remove_column :divisions, :image_content_type, :string
  end
end

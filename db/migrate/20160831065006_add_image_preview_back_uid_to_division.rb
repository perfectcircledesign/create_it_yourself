class AddImagePreviewBackUidToDivision < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :image_preview_back_uid, :string
  end
end

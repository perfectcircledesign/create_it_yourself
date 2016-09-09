class AddImagePreviewFrontUidToDivision < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :image_preview_front_uid, :string
  end
end

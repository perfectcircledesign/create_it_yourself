class AddUserUploadToCardImage < ActiveRecord::Migration[5.0]
  def change
    add_column :card_images, :user_upload, :boolean
  end
end

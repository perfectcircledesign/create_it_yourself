class RemoveImageUidFromCardImage < ActiveRecord::Migration[5.0]
  def change
    remove_column :card_images, :image_uid, :string
  end
end

class AddOverlayImageUidToCardImage < ActiveRecord::Migration[5.0]
  def change
    add_column :card_images, :overlay_image_uid, :string
  end
end

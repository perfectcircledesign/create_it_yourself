class AddImageUidToCardImage < ActiveRecord::Migration[5.0]
  def change
    add_column :card_images, :image_uid, :string
  end
end

class AddCrewCardImagePreviewBackUidToDivision < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :crew_card_image_preview_back_uid, :string
  end
end

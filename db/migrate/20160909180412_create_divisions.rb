class CreateDivisions < ActiveRecord::Migration[5.0]
  def change
    create_table :divisions do |t|
      t.string :name
      t.string :image_uid
      t.string :image_back_uid
      t.string :image_cut_uid
      t.string :image_preview_front_uid
      t.string :image_preview_back_uid
      t.integer :company_id
      t.string :slug
      t.string :head_email_address
      t.string :head_name

      t.timestamps
    end
  end
end

class AddImageUidToDivision < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :image_uid, :string
  end
end

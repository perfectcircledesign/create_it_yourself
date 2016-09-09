class AddImageBackUidToDivision < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :image_back_uid, :string
  end
end

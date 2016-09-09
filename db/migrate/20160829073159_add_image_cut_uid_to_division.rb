class AddImageCutUidToDivision < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :image_cut_uid, :string
  end
end

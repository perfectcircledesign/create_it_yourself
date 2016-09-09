class RemoveImageUpdatedAtFromDivision < ActiveRecord::Migration[5.0]
  def change
    remove_column :divisions, :image_updated_at, :datetime
  end
end

class AddSlugToDivisions < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :slug, :string
  end
end

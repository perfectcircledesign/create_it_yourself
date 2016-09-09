class AddHeadEmailAddressToDivisions < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :head_email_address, :string
  end
end

class AddReplaceFieldToEmailSigField < ActiveRecord::Migration[5.0]
  def change
    add_column :email_sig_fields, :replace_field, :string
  end
end

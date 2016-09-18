class AddPrefixToEmailSigField < ActiveRecord::Migration[5.0]
  def change
    add_column :email_sig_fields, :prefix, :string
  end
end

class RemoveHashFromEmailSigField < ActiveRecord::Migration[5.0]
  def change
    remove_column :email_sig_fields, :hash, :string
  end
end

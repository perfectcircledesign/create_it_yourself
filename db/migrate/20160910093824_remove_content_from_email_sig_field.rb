class RemoveContentFromEmailSigField < ActiveRecord::Migration[5.0]
  def change
    remove_column :email_sig_fields, :content, :string
  end
end

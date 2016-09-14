class AddDefaultEmailSigImageUidToDivision < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :default_email_sig_image_uid, :string
  end
end

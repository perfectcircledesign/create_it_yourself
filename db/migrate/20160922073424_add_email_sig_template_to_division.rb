class AddEmailSigTemplateToDivision < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :email_sig_template_uid, :string
  end
end

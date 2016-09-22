class RemoveEmailSigTemplateUpdatedAtFromDivision < ActiveRecord::Migration[5.0]
  def change
    remove_column :divisions, :email_sig_template_updated_at, :timestamp
  end
end

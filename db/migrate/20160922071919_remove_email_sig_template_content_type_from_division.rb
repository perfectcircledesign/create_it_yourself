class RemoveEmailSigTemplateContentTypeFromDivision < ActiveRecord::Migration[5.0]
  def change
    remove_column :divisions, :email_sig_template_content_type, :string
  end
end

class RemoveEmailSigTemplateFileSizeFromDivision < ActiveRecord::Migration[5.0]
  def change
    remove_column :divisions, :email_sig_template_file_size, :integer
  end
end

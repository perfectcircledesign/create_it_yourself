class AddCompanyLogoToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :company_logo_uid, :string
  end
end

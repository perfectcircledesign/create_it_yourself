class AddCompanyIdToDivision < ActiveRecord::Migration[5.0]
  def change
    add_column :divisions, :company_id, :integer
  end
end

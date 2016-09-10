class CreateJoinTableDivisionsEmailSigFields < ActiveRecord::Migration[5.0]
  def change
    create_join_table :divisions, :email_sig_fields do |t|
      # t.index [:division_id, :email_sig_field_id]
      # t.index [:email_sig_field_id, :division_id]
    end
  end
end

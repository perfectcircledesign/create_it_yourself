class CreateEmailSigFields < ActiveRecord::Migration[5.0]
  def change
    create_table :email_sig_fields do |t|
      t.string :content
      t.string :hash
      t.integer :order

      t.timestamps
    end
  end
end

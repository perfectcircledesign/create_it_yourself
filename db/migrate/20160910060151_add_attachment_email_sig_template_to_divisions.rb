class AddAttachmentEmailSigTemplateToDivisions < ActiveRecord::Migration
  def self.up
    change_table :divisions do |t|
      t.attachment :email_sig_template
    end
  end

  def self.down
    remove_attachment :divisions, :email_sig_template
  end
end

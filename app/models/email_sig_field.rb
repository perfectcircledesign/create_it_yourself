class EmailSigField < ApplicationRecord
	has_and_belongs_to_many :divisions, :join_table => 'divisions_email_sig_fields'
end

class EmailSigField < ApplicationRecord
	has_and_belongs_to_many :divisions, :join_table => 'crew_card_fields_divisions'
end

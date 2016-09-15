class Font < ApplicationRecord
	has_many :business_card_fields
	has_many :crew_card_fields
end

class Company < ApplicationRecord
	has_many :divisions

	extend FriendlyId
	friendly_id :name, use: :slugged

	
end

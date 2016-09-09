class Company < ApplicationRecord
	has_many :divisions

	extend FriendlyId
	friendly_id :name, use: :slugged

	extend Dragonfly::Model
  	extend Dragonfly::Model::Validations

  	dragonfly_accessor :company_logo


	
end

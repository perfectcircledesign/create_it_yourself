class CardImage < ApplicationRecord
	belongs_to :division

  	extend Dragonfly::Model
  	extend Dragonfly::Model::Validations

	dragonfly_accessor :image
end

class CardField < ApplicationRecord
	has_and_belongs_to_many :divisions, :join_table => 'card_fields_divisions'
	belongs_to :font
end

class InputField < ApplicationRecord
	has_and_belongs_to_many :divisions, :join_table => 'divisions_input_fields'
	belongs_to :font
end

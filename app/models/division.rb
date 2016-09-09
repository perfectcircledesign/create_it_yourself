class Division < ApplicationRecord
	
	belongs_to :company

	has_and_belongs_to_many :input_fields, :join_table => 'divisions_input_fields'

	attr_accessor :email_receiver

	#validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	extend FriendlyId
	friendly_id :name, use: :slugged

  	extend Dragonfly::Model
  	extend Dragonfly::Model::Validations
	

	dragonfly_accessor :image
	dragonfly_accessor :image_back
	dragonfly_accessor :image_cut
	dragonfly_accessor :image_preview_front
	dragonfly_accessor :image_preview_back
end

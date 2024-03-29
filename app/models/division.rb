class Division < ApplicationRecord
	
	belongs_to :company

	has_and_belongs_to_many :card_fields, :join_table => 'card_fields_divisions'
	has_and_belongs_to_many :email_sig_fields, :join_table => 'divisions_email_sig_fields'
	has_many :card_images


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
	dragonfly_accessor :email_sig_template
	dragonfly_accessor :default_email_sig_image
	dragonfly_accessor :crew_card_image_front
	dragonfly_accessor :crew_card_image_back
	dragonfly_accessor :crew_card_image_preview_front
	dragonfly_accessor :crew_card_image_preview_back
end

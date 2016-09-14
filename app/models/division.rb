class Division < ApplicationRecord
	
	belongs_to :company

	has_and_belongs_to_many :business_card_fields, :join_table => 'business_card_fields_divisions'
	has_and_belongs_to_many :email_sig_fields, :join_table => 'divisions_email_sig_fields'

	attr_accessor :email_receiver

	#validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	extend FriendlyId
	friendly_id :name, use: :slugged

  	extend Dragonfly::Model
  	extend Dragonfly::Model::Validations


	has_attached_file :email_sig_template
	validates_attachment_content_type :email_sig_template, :content_type => ["text/html"]
	

	dragonfly_accessor :image
	dragonfly_accessor :image_back
	dragonfly_accessor :image_cut
	dragonfly_accessor :image_preview_front
	dragonfly_accessor :image_preview_back
	dragonfly_accessor :default_email_sig_image
end

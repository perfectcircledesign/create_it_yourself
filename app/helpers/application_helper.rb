module ApplicationHelper

	# def absolute_attachment_url(attachment_name, attachment_style = :original)
 #  		"#{request.protocol}#{request.host_with_port}#{attachment_name(attachment_style)}"
	# end

	def card_image(card, preview)
		if preview == 'true'
		 card.remote_url
		else
		 Rails.env.production? ? card.remote_url : card.path
		end
	end

end

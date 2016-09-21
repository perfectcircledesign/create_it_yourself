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

	def calc_string_width(field)

		the_text = session[:field_inputs]["field_#{field.id}"]
		label = Magick::Draw.new
		label.font = "/home/nic/cOdin/PerfectCircle/create_it_yourself/public/fonts/#{field.font.name}.ttf" #you can also specify a file name... check the rmagick docs to be sure
		label.text_antialias(true)
		label.pointsize = (field.size.to_f)*2
		label.font_style=Magick::NormalStyle
		# label.gravity=Magick::CenterGravity
		label.text(0,0,the_text)
		metrics = label.get_type_metrics(the_text)
		string_width = metrics.width
		puts 'xxxxxxxxxxxxxx    string width = '
		puts string_width

		return string_width
	end

end

class PdfMailer < ApplicationMailer


  def tester(pdf, division, card_holder_name, card_holder_email, purchase_order_number)

      
      puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

      puts pdf
      
      puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

      
      attachments['test.pdf'] = File.read(pdf) 
      mail(:to => "nicholas@perfectcircle.co.za", :subject => "Online Business Card Generator ", :body => "Good day\n\n#{division.name} has requested business cards for approval via the Online Business Card Generator, for #{card_holder_name}. The quantity that they have selected is # at R#, referencing #{purchase_order_number}. From proof of receipt, the order will take 5 working days.\n\nThank you.\n\nRegards\n\nCoca-Cola Team")
      #mail(:to => "info@simonsays.co.za", :subject => "Online Business Card Generator ", :body => "Good day\n\n#{division.name} has requested business cards for approval via the Online Business Card Generator, for #{card_holder_name}. The quantity that they have selected is #{print_number} at R#, referencing #{purchase_order_number}. From proof of receipt, the order will take 5 working days.\n\nThank you.\n\nRegards\n\nCoca-Cola Team")
  end





  # def email_simon_says(pdf, print_number )
		# attachments['test.pdf'] = File.read(pdf) 
		# mail(:to => "gauragaura@gmail.com", :subject => "Business Card", :body => "Hi Janneke, Please print #{print_number} of the attached business cards. Thanks :)")
    
  # end

  # def email_head_of_department(pdf, email_receiver, print_number, division)
 	# 	#raise
		# attachments['test.pdf'] = File.read(pdf) 

		# if print_number == 0
		# 	mail(:to => "#{email_receiver}", :subject => "Business Card", :body => "Please find attached the requested business card.")
  # 		else
  # 			mail(:to => "#{email_receiver}", :subject => "Business Card", :body => "This is a notification that the attached business card has been sent to Simon Says for printing (#{print_number} of copies).")
  # 		end
  # end

  # def email_creator(pdf, email_receiver, print_number, division)
  # 		#raise
		# attachments['test.pdf'] = File.read(pdf) 

		# if print_number == 0
		# 	mail(:to => "#{email_receiver}", :subject => "Business Card", :body => "Please find attached the requested business card.")
  # 		else
  # 			mail(:to => "#{email_receiver}", :subject => "Business Card", :body => "This is a notification that the attached business card has been sent to Simon Says for printing (#{print_number} of copies).")  end

		# end

  

end
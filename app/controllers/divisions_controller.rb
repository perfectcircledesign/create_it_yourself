class DivisionsController < ApplicationController 

  before_action :set_division, only: [:show, :generate, :preview, :completed_job, :create_email_sig] 
  before_action :set_company, only: [:generate, :show, :preview, :completed_job]
  before_action :set_images, only: [:show, :preview, :generate]

	def index 
    
    @company = Company.where(slug: params[:company]).first
    @divisions = @company.divisions
    session[:function] = params[:function] if !params[:function].nil?

    if @company.divisions.count == 1
      division = @company.divisions.first
      redirect_to generate_division_path(division)
    
    #I'M SORRY FOR THIS UGLY HACK :/
    elsif @company.slug == "airschool43" and params[:function] != "crew_card"

      redirect_to generate_division_path(@divisions.first)
    end
  
  end

	def show
    
     if session[:function] == 'business_card' or session[:function] == 'crew_card'

      @card_fields = CardField.where(function: session[:function]).joins(:divisions).where("division_id = ? ",@division.id)

      puts "CARD FIELDS params!!!!!!!!!!!!!#{params}"
        #THIS HAS TO BE CLEANED UP
        if @card_fields.where(name: "Associate Name").exists?
          card_holder_name = params[:"#{@card_fields.where(name: "Associate Name").last.id}"]
        elsif @card_fields.where(name: "Name Surname").exists?
          card_holder_name = params[:"#{@card_fields.where(name: "Name Surname").last.id}"]
        end
        if @card_fields.where(name: "email").exists?
          card_holder_email = params[:"#{@card_fields.where(name: "email").last.id}"]
        end
        purchase_order_number =  params[:"Purchase Order"]
        #UP TO HERE

        #CONCAT name and name line 2 if name line 2 is not empty
        if @card_fields.where(name: "Name line 2 if needed").exists?
            card_holder_name2 = params[:"#{@card_fields.where(name: "Name line 2 if needed").last.id}"]
            unless card_holder_name2 == ""
              card_holder_name2 = " " + card_holder_name2  
            end
            card_holder_name =  card_holder_name + card_holder_name2
        end
        #END CONCAT


      #create specific pdf for adendorf because its fields are right aligned
          if @company.name.downcase == 'adendorff'
           render :pdf => "filename.pdf",
            :template => 'divisions/create_pdf.html.erb',#, :show_as_html => true
              :page_height => 6.485,
                  :page_width => 12.483,
                    margin:  { top: 0, bottom: 3, left: 5, right: 0 },
                      :align => 'right',
                        :save_to_file => Rails.root.join('tmp', "filename.pdf"),                                  
                            :show_as_html => true, :dpi => '300', :save_only => true
          else
            render :pdf => "filename.pdf",
                   :template => 'divisions/create_pdf.html.erb',#, :show_as_html => true
                   :page_height => "#{@card_front.height / 300.0 *  25.4}",
                   :page_width => "#{@card_front.width / 300.0 * 25.4}",
                   margin:  { top: 10, bottom: 3, left: 5, right: 0 },
                   :align => 'right',
                   :save_to_file => Rails.root.join('tmp', "filename.pdf"),
                   :show_as_html => false, :dpi => '300', :save_only => true
          end


        @file2 = Tempfile.new('temp_route_pdf', "#{Rails.root}/tmp/")
        #CUT OFF LAST BLANK PAGE
        if @division.image_cut.present?
          final_page = 3
        else
          final_page = 2
        end
         `pdftk "#{Rails.root}/tmp/filename.pdf" cat 1-"#{final_page}" output "#{@file2.path}"`
        #CUT OFF LAST BLANK PAGE FINISHED    

        if session[:function] == 'business_card' and @company.slug == 'coca-cola'
          PdfMailer.cocacola(@file2.path,@division, card_holder_name, card_holder_email, purchase_order_number).deliver 
        elsif @company.slug == 'airschool43'
          #raise
          PdfMailer.airschool43(@file2.path,@division, card_holder_name, card_holder_email, purchase_order_number).deliver 
        elsif @company.slug == 'adendorff'
          PdfMailer.adendorff(@file2.path,@division, card_holder_name, card_holder_email, purchase_order_number).deliver
        else
          
        end
        # redirect_to completed_job_division_path
    end
    #END OF CARD FUNCTION
    if session[:function] == 'email_sig'
    end
  end



  def completed_job
    if session[:function] == "business_card" or session[:function] == "crew_card"
      render :template => 'divisions/completed_card.html.erb'
    end
  end

	def new
		@division = Division.new
	end

  def generate

    if session[:function] == 'business_card' or session[:function] == 'crew_card'

      @card_fields = CardField.where(function: session[:function]).joins(:divisions).where("division_id = ? ",@division.id)

      unless params[:back].present?
          session.delete(:field_inputs)
      end
      render :template => 'divisions/generate_card.html.erb'
    end

    if session[:function] == "email_sig"
      @email_sig_fields = EmailSigField.all
      unless params[:back].present?
          session.delete(:field_inputs)
      end

      #REPLACE "IMAGE" STRING WITH DEFAULT IMAGE:
      create_email_sig
      @generated_email_sig = @generated_email_sig.gsub("IMAGE", "/assets/#{@division.default_email_sig_image.name}")
      File.write(@generated_email_sig_file.path, "#{@generated_email_sig}")
      #COMPLETE: DEFAULT IMAGE PLACED

      render :template => 'divisions/generate_email_sig.html.erb'
    end

  end

  def preview
    if session[:function] == 'business_card' or session[:function] == 'crew_card'

      @card_fields = CardField.where(function: session[:function]).joins(:divisions).where("division_id = ? ",@division.id)

      unless params[:returning]
        session[:field_inputs] = params[:field_inputs].each do |field| field end
        @card_fields = CardField.where(function: session[:function]).joins(:divisions).where("division_id = ? ",@division.id)
      end
      #render :template => 'divisions/preview_card.html.erb'
   
      if @division.card_images.where(function: session[:function]).where(user_upload: true).exists?
        
        session[:image_path] = []
        @division.card_images.where(function: session[:function]).where(user_upload: true).each do |image|
          session["image_#{image.id}"] = params["image_#{image.id}"].original_filename
          directory = "#{Rails.root}/public/assets"
          session[:image_path][image.id] = File.join(directory, session["image_#{image.id}"])
          File.open(session[:image_path][image.id], "wb") { |f| f.write(params["image_#{image.id}"].read) }
        end

        @division.card_images.where(function: session[:function]).where(user_upload: true).each do |image|
          if @division.card_images.where(function: session[:function]).where(user_upload: true).present?

            session[:x_res] = FastImage.size(session[:image_path][image.id])[0].to_f
            session[:y_res] = FastImage.size(session[:image_path][image.id])[1].to_f
          end
        end
        
        session[:x_axis] = params[:x_axis]
        session[:y_axis] = params[:y_axis]
        session[:scale] = params[:scale]
        session[:width] = params[:width]
        session[:height] = params[:height] 
      end
      render :template => 'divisions/preview_card.html.erb'
    end    

    if session[:function] == 'email_sig'

      unless params[:returning]

        session[:field_inputs] = params[:field_inputs].each do |field| field end
        @email_sig_fields = EmailSigField.all
      end
      create_email_sig


      puts "GENERATE PARAMS::::: #{params}"
      puts "Session fields: #{session[:field_inputs]}"
      @params = params

      File.write(@generated_email_sig_file.path, "#{@generated_email_sig}")

      puts "------------------------#{@generated_email_sig}"
      render :template => 'divisions/preview_email_sig.html.erb'
    end
  end


  private

  def division_params
    params.require(:division).permit(:name, :image, :image_back, :image_cut, :image_preview_front, :image_preview_back, :slug, :email_choice, :associate_name)
  end

  def set_division
    @division = Division.find_by_slug(params[:id])
  end

  def set_company
    @company = @division.company   
  end

  def create_email_sig

    @generated_email_sig_file = Tempfile.new('temp_route_sig', "#{Rails.root}/tmp/")
    @generated_email_sig = File.read(@division.email_sig_template.path)
    #REPLACE FIELDS IN TEMPLATE WITH INPUT + PREFIX
    if session[:field_inputs].present?
      session[:field_inputs].each do |field| 
        if field[1].empty?
          @generated_email_sig = @generated_email_sig.gsub(field[0],"")
        else
          @generated_email_sig = @generated_email_sig.gsub(field[0],@division.email_sig_fields.where(replace_field: field[0]).first.prefix + " " + field[1])
        end
      end
    end
  end

  #BELOW ENABLES THE RE-USE OF BCG FOR CALLCARDS ETC.
  def set_images
    if session[:function] == 'business_card'
      @card_front = @division.image
      @card_back  = @division.image_back 
      @card_front_preview = @division.image_preview_front
      @card_back_preview  = @division.image_preview_back
    elsif session[:function] == 'crew_card'
      @card_front = @division.crew_card_image_front
      @card_back  = @division.crew_card_image_back
      @card_front_preview = @division.crew_card_image_preview_front
      @card_back_preview  = @division.crew_card_image_preview_back
    end


  end

end


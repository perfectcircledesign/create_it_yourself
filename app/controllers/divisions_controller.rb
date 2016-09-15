class DivisionsController < ApplicationController 

  before_action :set_division, only: [:show, :generate, :preview, :completed_job] 
  before_action :set_company, only: [:generate, :show, :preview, :completed_job]
  before_action :set_images, only: [:show, :preview, :generate]
  #before_action :set_function, only: [:generate, :show, :preview, :completed_job]

	def index 
    @company = Company.where(slug: params[:format]).first
    @divisions = @company.divisions
    session[:function] = params[:function]
    # TODO: ASK GERARD:  session var vs param passed in url for function ?
  end

	def show
    @card_fields = BusinessCardField.all
    
     if session[:function] == "business_card"
      
        #THIS HAS TO BE CLEANED UP
        if @division.business_card_fields.where(name: "Associate Name").exists?
          card_holder_name = params[:"#{@division.business_card_fields.where(name: "Associate Name").last.id}"]
        end
        if @division.business_card_fields.where(name: "email").exists?
          card_holder_email = params[:"#{@division.business_card_fields.where(name: "email").last.id}"]
        end
        purchase_order_number =  params[:"Purchase Order"]
        #UP TO HERE

        #CONCAT name and name line 2 if name line 2 is not empty
        if @division.business_card_fields.where(name: "Name line 2 if needed").exists?
            card_holder_name2 = params[:"#{@division.business_card_fields.where(name: "Name line 2 if needed").last.id}"]
            unless card_holder_name2 == ""
              card_holder_name2 = " " + card_holder_name2  
            end
            card_holder_name =  card_holder_name + card_holder_name2
        end
        #END CONCAT

          render :pdf => "filename.pdf",
            :template => 'divisions/create_pdf.html.erb',#, :show_as_html => true
              :page_height => "#{@division.image.height / 300.0 *  25.4}",
                  :page_width => "#{@division.image.width / 300.0 * 25.4}",
                      margin:  { top: 0, bottom: 0, left: 0, right: 0 },
                        :save_to_file => Rails.root.join('tmp', "filename.pdf"),                                  
                          :show_as_html => false, :dpi => '300', :save_only => true    


        @file2 = Tempfile.new('temp_route_pdf', "#{Rails.root}/tmp/")
        #CUT OFF LAST BLANK PAGE
        if @division.image_cut.present?
          final_page = 3
        else
          final_page = 2
        end
         `pdftk "#{Rails.root}/tmp/filename.pdf" cat 1-"#{final_page}" output "#{@file2.path}"`
        #CUT OFF LAST BLANK PAGE FINISHED    
        PdfMailer.tester(@file2.path,@division, card_holder_name, card_holder_email, purchase_order_number).deliver
    end

    if session[:function] == "email_sig"
      

    end

    redirect_to completed_job_division_path
    
  end



  def completed_job
    if session[:function] == "business_card"
      render :template => 'divisions/completed_business_card.html.erb'
    elsif session[:function] == "email_sig"
      render :template => 'divisions/completed_email_sig.html.erb'
    end
     
  end

	def new
		@division = Division.new
	end

  def generate

    if session[:function] == 'business_card'
      @card_fields = BusinessCardField.all
      unless params[:back].present?
          session.delete(:field_inputs)
      end
      render :template => 'divisions/generate_card.html.erb'
    end

    if session[:function] == 'crew_card'
      @card_fields = CrewCardField.all
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
    
    if session[:function] == 'business_card'
      unless params[:returning]
        session[:field_inputs] = params[:field_inputs].each do |field| field end
        @card_fields = BusinessCardField.all
      end
      render :template => 'divisions/preview_card.html.erb'
    end

    if session[:function] == 'crew_card'
      unless params[:returning]
        session[:field_inputs] = params[:field_inputs].each do |field| field end
        @card_fields = CrewCardField.all
      end
      render :template => 'divisions/preview_card.html.erb'
    end    

    if session[:function] == 'email_sig'
      unless params[:returning]
        session[:field_inputs] = params[:field_inputs].each do |field| field end
        @email_sig_fields = EmailSigField.all
      end

      # @generated_email_sig_file = Tempfile.new('temp_route_sig', "#{Rails.root}/tmp/")
      # @generated_email_sig = File.read(@division.email_sig_template.path)

      # session[:field_inputs].each do |field| 
      #   @generated_email_sig = @generated_email_sig.gsub(field[0],field[1])
      # end
        
      
      create_email_sig
      
      #PROCESS UPLOADED IMAGE
      session[:file_name] = params[:picture].original_filename
      directory = "#{Rails.root}/public/assets"
      @file_path = File.join(directory, session[:file_name])
      File.open(@file_path, "wb") { |f| f.write(params[:picture].read) }
      #COMPLETE: IMAGE UPLOADED

      @generated_email_sig = @generated_email_sig.gsub("IMAGE", "/assets/#{session[:file_name]}")
       

      File.write(@generated_email_sig_file.path, "#{@generated_email_sig}")
      #render :template => 'divisions/temp_image_testing.html.erb'
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

    if session[:field_inputs].present?
      session[:field_inputs].each do |field| 
        @generated_email_sig = @generated_email_sig.gsub(field[0],field[1])
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


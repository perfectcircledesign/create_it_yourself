class DivisionsController < ApplicationController 

  before_action :set_division, only: [:show, :generate, :preview, :created_business_card] 
  before_action :set_company, only: [:generate, :show, :created_business_card]

	def index 
    @company = Company.where(slug: params[:format]).first
    @divisions = @company.divisions
  end

	def show
    @input_fields = InputField.all
    card_holder_name = params[:"#{@division.input_fields.where(field_name: "Associate Name").last.id}"]
    card_holder_email = params[:"#{@division.input_fields.where(field_name: "email").last.id}"]
    purchase_order_number =  params[:"Purchase Order"]
    #@redirected = 2

    #CONCAT name and name line 2 if name line 2 is not empty
    if @division.input_fields.where(field_name: "Name line 2 if needed").exists?
        card_holder_name2 = params[:"#{@division.input_fields.where(field_name: "Name line 2 if needed").last.id}"]
        unless card_holder_name2 == ""
          card_holder_name2 = " " + card_holder_name2  
        end
        card_holder_name =  card_holder_name + card_holder_name2
    end
    #END CONCAT


    #PSEUDOCODE FOR CHECKING P.O NUMBER 
    #if params is 10 chars and number, then continue, else redirect
    if params[:"Purchase Order"] == "1"
      flash[:success] = "BLEH"      
      params[:"Purchase Order"] = "2"

      #raise
      # redirect_to preview_division_path(:returning => true)
      
    end
          render :pdf => "filename.pdf",
                :template => 'divisions/create_pdf.html.erb',#, :show_as_html => true
                 :dpi => '300',
                   :page_height => "#{@division.image.height / 300.0 *  25.4}",
                     :page_width => "#{@division.image.width / 300.0 * 25.4}",
                                     
                       :show_as_html => false,
                         margin:  {   top: 0,                     # default 10 (mm)
                                   bottom: 0,
                                   left: 0,
                                   right: 0 },
                                     :save_to_file => Rails.root.join('tmp', "filename.pdf"),                                  
                                    :save_only => true    

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
    redirect_to completed_job_division_path
    
  end



  def completed_job
    #WHEN AN ORDER HAS BEEN PROCESSED...
  end

	def new
		@division = Division.new
	end

  def generate
    @input_fields = InputField.all
    
    unless params[:back].present?
        session.delete(:field_inputs)
    end

  end

  def preview
    
    
    unless params[:returning]
      
      session[:field_inputs] = params[:field_inputs].each do |field| field end
      @input_fields = InputField.all
 
    end


  end


  private

  def division_params
    params.require(:division).permit(:name, :image, :image_back, :image_cut, :image_preview_front, :image_preview_back, :slug, :email_choice, :associate_name, :input_field_ids)
  end

  def set_division
    @division = Division.find_by_slug(params[:id])
  end

  def set_company
    @company = @division.company   
  end

end


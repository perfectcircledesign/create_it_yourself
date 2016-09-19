class CompaniesController < ApplicationController 

	before_action :set_company, only: [:show]

	def index 
		@companies = Company.all
	end

	def show
		 @company = Company.find_by_slug(params[:id])
     reset_session
	end

	def new
		@company = Company.new
	end

	def create
    	@company = Company.new(company_params)

    	respond_to do |format|
    		if @company.save
        		format.html { redirect_to @company, notice: 'Company was successfully created.' }
        		format.json { render :show, status: :created, location: @company }
      		else
        		format.html { render :new }
        		format.json { render json: @company.errors, status: :unprocessable_entity }
      		end
    	end
	end


  private

  def company_params
    params.require(:company).permit(:name, :slug)
  end

  def set_company
    @company = Company.find_by_slug(params[:id])
  end

end
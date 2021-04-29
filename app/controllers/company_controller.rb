class CompanyController < ApplicationController

    def index
     @company = Company.all
    end
 
    def show
     find_company
    end
 
    def new
     @company = Company.new 
    end
 
    def create
       params[:company][:user_id] = current_user.id
       @company = Company.new(company_params)
       if @company.save
          redirect_to company_path(@company)
       else
          render :new
       end
    end
 
    def edit
       find_company
    end
 
    def update
       find_company
       @company.update(company_params)
       if @company.valid?
          redirect_to company_path
       else
          render :edit
       end
    end
 
 private
 
 def company_params
    params.require(:company).permit(:type, :sorcery_score, :size)
 end
 
 end
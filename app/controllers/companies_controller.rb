class CompaniesController < ApplicationController
 
    before_action :redirect_if_not_logged_in, :current_user
    before_action :find_company, only: [:show, :edit, :update, :destroy]
    
    
    def index
        @companies = Company.all 
    end

    def show
        find_company 
    end

    def recent_companies
        @companies = Company.newest_companies
        render :index
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new(company_params)
        @company.owner = current_user
        if @company.save 
            redirect_to company_path(@company)
        else
            render :new
        end   
    end


    def edit
        @company = current_user.companies.find(params[:id])
    end

    def update   
        @company.update(company_params)
        if @company.valid?
            redirect_to companies_path
        else
            render :edit
        end
    end

    def destroy
        if current_user.id != @company.user_id
            redirect_to companies_path
        else 
            @company.destroy 
            redirect_to companies_path
        end
    end

    private


    def company_params
        params.require(:company).permit(:name, :category, :description)
    end

    def find_company
        @company = Company.find_by_id(params[:id])
    end

end
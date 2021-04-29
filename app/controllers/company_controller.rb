class CompanyController < ApplicationController
 
    before_action :redirect_if_not_logged_in, :current_user
    before_action :find_company, only: [:show, :edit, :update, :destroy]
    
    def index
        @company = Company.all 
    end

    def show
        find_company 
    end

    def recent_company
        @company = Company.newest_companies
        render :index
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new(company_params)
        if @Company.save 
            redirect_to company_path(@company)
        else
            render :new
        end   
    end


    def edit
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

    


    def companies_params
        params.require(:company).permit(:title, :category)
    end

    def find_company
        @company = Company.find_by_id(params[:id])
    end

    def find_company
        @company = Company.find_by_id(params[:id])
    end

end
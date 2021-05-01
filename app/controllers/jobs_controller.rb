class JobsController < ApplicationController
    
    before_action :redirect_if_not_logged_in
    before_action :find_job, only: [:show, :edit, :update, :destroy]
    before_action :find_job, only: [:show, :edit, :destroy]

    #macro to run particular method before the action methods below execute. Useful because we're able to create validations as well as queries to populate a specific instance variable that we may use within that method. Decreases lines of code and keeps stuff dry. 

    def index
        if params[:company_id] && @spellbook = Company.find(params[:company_id])
            @jobs = @company.jobs
        else
            @jobs = Job.all
        end
    end

    def show
    end

    def new
        @company = Company.find(params[:company_id])
        @job = @company.jobs.build
        
    end

    def create
        @job = current_user.jobs.build(job_params)
        @job.company_id = params[:company_id]
        if @job.save
            redirect_to company_job_path(params[:company_id],@job)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @job = Job.find(params[:id])
        @job.update(job_params)
        if @job.valid? 
            redirect_to job_path(@job)
        else
            render :edit
        end
    end

    def destroy
        #authorized_to_edit?
        if current_user 
        @job.destroy
        redirect_to companies_path
        else 
        find_job
        end
    end
    
    private
    def job_params
        params.require(:job).permit(:name, :category, :description, :company_id, company_attributes: [:id, :user_id, :name, :category])
    end

    def redirect_if_not_company_owner
        find_job
        find_company 
        return redirect_to jobs_path unless @company
        redirect_to jobs_path unless current_user.id == @company.user_id
    end

    def find_company
        @company = Company.find_by_id(params[:company_id])
    end

    def find_job
        @job = Job.find_by_id(params[:id])
    end
end
class JobsController < ApplicationController
    
    before_action :redirect_if_not_logged_in
    before_action :find_job, only: [:show, :edit, :update, :destroy]
    

    
    def index 
            params[:company_id] && @company = Company.find(params[:company_id])
            @jobs = @company.jobs  
    end

    def show
        @company = Company.find(params[:company_id])
        @job = @company.jobs.find(params[:id])
    end

    def all_jobs
        @jobs = Job.all_jobs
        render :index
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
        @job_id = params[:id]
        job_redirect_if_not_authorized
    end

    def update
        @job = Job.find(params[:id])
        @job.update(job_params)
        if @job.valid? 
            redirect_to company_jobs_path(params[:job][:company_id])
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

    def job_redirect_if_not_authorized
        job = Job.find_by_id(params[:id])
        if job || job.user_id != session["user_id"]
            redirect_to companies_path
        end
    end

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
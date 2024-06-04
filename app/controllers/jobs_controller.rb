class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy ]
  before_action :authorized

  def index
    params.permit(:title, :description, :skills)
    title = params[:title]
    description = params[:description]
    skills = params[:skills]
    @jobs = Job.where(status: "ACTIVE").where("title like ?", "%#{title}%").where("description like ?", "%#{description}%").where("skills like ?", "%#{skills}%")
  end

  def show
    @recruiter = Recruiter.find(@job.recruiter_id)
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.create(job_params)
    @recruiter = Recruiter.find(job_params[:recruiter_id])
    if @job.save
      @error = nil
    else
      @error =  @job.errors.full_messages.to_sentence
    end
  end

  def update
    if @job.update(job_params)
      @error = nil
    else
      @error = @job.errors.full_messages.to_sentence
    end
  end

  def destroy
    if @job.present?
      @job.destroy
    end
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:title)
      params.require(:description)
      params.require(:recruiter_id)
      params.permit(:title, :description, :start_date, :end_date, :status, :recruiter_id, :job, skills: [])
    end
end

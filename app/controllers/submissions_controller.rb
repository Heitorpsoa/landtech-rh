class SubmissionsController < ApplicationController
  before_action :set_submission, only: %i[ show update destroy ]
  before_action :authorized

  def index
    @submissions = Submission.all
  end

  def show
  end

  def create
    @submission = Submission.new(submission_params)

    duplicate_submission = Submission.where(job_id: submission_params[:job_id], email: submission_params[:email]).first
    if duplicate_submission.present?
      @error = "Duplicate submission, submission ID: " + duplicate_submission.id.to_s
      return
    end
    if @submission.save
      @error = nil
    else
      @error = @submission.errors.full_messages.to_sentence
    end
  end

  def update
    if @submission.update(submission_params)
      @error = nil
    else
      @error = @submission.errors.full_messages.to_sentence
    end
  end

  def destroy
    if @submission.present?
      @submission.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      begin
        @submission = Submission.find(params[:id])
      rescue
        @error = "ID not found"
      end
    end

    # Only allow a list of trusted parameters through.
    def submission_params
      params.permit(:name, :email, :mobile_phone, :resume, :job_id)
    end
end

class RecruitersController < ApplicationController
  before_action :set_recruiter, only: %i[ show edit update destroy ]

  def show
    authorized
  end

  def edit
    authorized
  end

  def login
    @recruiter = Recruiter.find_by(email: params[:email])
    if @recruiter.nil?
      @error = "Email not found"
    elsif @recruiter.authenticate(params[:password])
        @token = encode_token(user_id: @recruiter.id)
    else
        @error = "Wrong password"
    end
  end

  # POST /recruiters or /recruiters.json
  def create
    @recruiter = Recruiter.new(recruiter_params)
    if @recruiter.save
      @token = encode_token(user_id: @recruiter.id)
      @error = nil
    else
      @error =  @recruiter.errors.full_messages.to_sentence
    end
  end

  # PATCH/PUT /recruiters/1 or /recruiters/1.json
  def update
      if @recruiter.update(recruiter_params)
        @error = nil
      else
        @error =  @recruiter.errors.full_messages.to_sentence
      end
  end

  # DELETE /recruiters/1 or /recruiters/1.json
  def destroy
    authorized
    if @user.try(:[], :id) != @recruiter.try(:[], :id)
      @error = "Unauthorized"
      return
    end
    if @recruiter
      @recruiter.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruiter
      begin
        @recruiter = Recruiter.find(params[:id])
      rescue
        @error = "ID not found"
      end
    end

    # Only allow a list of trusted parameters through.
    def recruiter_params
      params.require(:name)
      params.require(:email)
      params.require(:password)
      params.require(:password_confirmation)
      params.permit(:name, :email, :password, :password_confirmation) 
    end
end

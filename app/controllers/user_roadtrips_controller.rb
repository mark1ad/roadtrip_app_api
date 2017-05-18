class UserRoadtripsController < ApplicationController
  before_action :set_user_roadtrip, only: [:show, :update, :destroy]

  # GET /user_roadtrips
  def index
    @user_roadtrips = UserRoadtrip.all

    render json: @user_roadtrips
  end

  # GET /user_roadtrips/1
  def show
    render json: @user_roadtrip
  end

  # POST /user_roadtrips
  def create
    @user_roadtrip = UserRoadtrip.new(user_roadtrip_params)

    if @user_roadtrip.save
      render json: @user_roadtrip, status: :created, location: @user_roadtrip
    else
      render json: @user_roadtrip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_roadtrips/1
  def update
    if @user_roadtrip.update(user_roadtrip_params)
      render json: @user_roadtrip
    else
      render json: @user_roadtrip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_roadtrips/1
  def destroy
    @user_roadtrip.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_roadtrip
      @user_roadtrip = UserRoadtrip.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_roadtrip_params
      params.require(:user_roadtrip).permit(:user_id, :roadtrip_id)
    end
end

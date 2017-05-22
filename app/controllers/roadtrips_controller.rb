class RoadtripsController < ApplicationController
  before_action :set_roadtrip, only: [:show, :update, :destroy]

  # GET /roadtrips
  def index
    @roadtrips = Roadtrip.all

    render json: @roadtrips.to_json(include: [:users, :cities])
  end

  # GET /roadtrips/1
  def show
    render json: @roadtrip.to_json(include: [:users, :cities])
  end

  # POST /user/1/roadtrips
  def create
    @roadtrip = Roadtrip.new(roadtrip_params)

    if @roadtrip.save
      # Add to join table
      UserRoadtrip.create(user_id: params[:user_id], roadtrip_id: @roadtrip.id)

      render json: @roadtrip.to_json(include: [:users, :cities]), status: :created
    else
      render json: @roadtrip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /roadtrips/1
  def update
    if @roadtrip.update(roadtrip_params)
      render json: @roadtrip
    else
      render json: @roadtrip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1/roadtrips/1
  def destroy
    @user_roadtrip = UserRoadtrip.where( user_id: params[:user_id], roadtrip_id: @roadtrip.id)
    @user_roadtrip[0].destroy
    @roadtrip.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roadtrip
      @roadtrip = Roadtrip.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def roadtrip_params
      params.require(:roadtrip).permit(:name, :description)
    end
end

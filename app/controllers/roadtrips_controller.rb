class RoadtripsController < ApplicationController
  before_action :set_roadtrip, only: [:show, :update, :destroy]

  # GET /roadtrips
  def index
    @roadtrips = Roadtrip.all

    render json: @roadtrips.to_json(include: :users)
  end

  # GET /roadtrips/1
  def show
    render json: @roadtrip.to_json(include: :users)
  end

  # POST /roadtrips
  def create
    @roadtrip = Roadtrip.new(roadtrip_params)

    if @roadtrip.save
      render json: @roadtrip, status: :created
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

  # DELETE /roadtrips/1
  def destroy
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

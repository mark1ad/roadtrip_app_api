class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :update, :destroy]

  # GET /cities
  def index
    @cities = City.all

    render json: @cities.to_json(include: :attractions)
  end

  # GET /cities/1
  def show
    render json: @city.to_json(include: :attractions)
  end

  # POST roadtrips/1/cities
  def create
    @city = City.new(city_params)
    @city.roadtrip_id = params[:roadtrip_id]

    if @city.save
      render json: @city, status: :created
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cities/1
  def update
    if @city.update(city_params)
      render json: @city
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cities/1
  def destroy
    @cities_to_update = City.where(roadtrip_id: @city.roadtrip_id)
    @cities_to_update.each do |updated_city|
      if updated_city.triporder > @city.triporder
        updated_city.triporder -= 1
        updated_city.save
      end
    end
    @city.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def city_params
      params.require(:city).permit(:location, :startdate, :triporder)
    end
end

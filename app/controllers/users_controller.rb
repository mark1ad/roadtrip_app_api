class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users.to_json(include: :roadtrips)
  end

  # GET /users/1
  def show
    render json: @user.to_json(include: :roadtrips)
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    roadtrips = []

    # Get all rows from join table where user_id = id
    @user_roadtrips = UserRoadtrip.where( user_id: params[:id])

    # For each row, get roadtrip_id and save in array then delete row
    @user_roadtrips.each do |trip|
      puts json: trip
      roadtrips.push( trip.roadtrip_id)
      trip.destroy
    end

    # destroy roadtrips
    roadtrips.uniq!
    roadtrips.each do |rt|
      @dtrip = Roadtrip.where(id: rt)
      puts ">>>>>>>>>>>>>"
      puts json: @dtrip
      @dtrip[0].destroy
    end

    # destroy user
    puts json: @user
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :password_digest)
    end
end

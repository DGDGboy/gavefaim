class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :top]
  skip_before_action :authenticate_user!, only: [:index,]

  def top
    @restaurants = Restaurant.where(rating: 9..10)
  end

  def index
    @restaurants = Restaurant.all
  end

  def show

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    @restaurant.user = current_user

    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :rating, :style, images: [], photos: [])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end

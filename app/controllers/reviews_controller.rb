class ReviewsController < ApplicationController

  def update

  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    restaurant = Restaurant.find(params[:restaurant_id])

    @review.restaurant = restaurant
    @review.user = current_user
    if @review.save
     redirect_to restaurant_path(restaurant)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

end

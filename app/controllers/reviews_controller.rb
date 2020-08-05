class ReviewsController < ApplicationController
  before_action :find_restaurant
  def new
    @review = Review.new
  end
  
  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to restaurant_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end

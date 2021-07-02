class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = current_user.tweets.all.order("created_at DESC")
  end
  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @tweet = Tweet.find(params[:id])
  end
  def edit
    @tweet = Tweet.find(params[:id])
  end
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path
  end


  private
  def tweet_params
    params.require(:tweet).permit(:energy_id,:food_id,:toilet_id,:poop_status_id,:exercise_id,:sleep_id,:different_id).merge(user_id: current_user.id)
  end
end

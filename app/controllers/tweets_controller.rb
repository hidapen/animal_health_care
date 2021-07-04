class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = current_user.tweets.all.order("created_at DESC")
  end

  def new
    @tweet = current_user.tweets.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tweet = current_user.tweets.find(params[:id])
  end

  def edit
    @tweet = current_user.tweets.find(params[:id])
  end

  def update
    @tweet = current_user.tweets.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to root_path
  end


  private
  def tweet_params
    params.require(:tweet).permit(:energy_id,:food_id,:toilet_id,:poop_status_id,:exercise_id,:sleep_id,:different_id,:start_time).merge(user_id: current_user.id)
  end
end

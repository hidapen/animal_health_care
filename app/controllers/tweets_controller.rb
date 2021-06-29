class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
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


  private
  def tweet_params
    params.require(:tweet).permit(:energy_id,:food_id,:toilet_id,:poop_status_id,:exercise_id,:sleep_id,:different_id).merge(user_id: current_user.id)
  end

end

class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = current_user.tweets.all
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
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    @tweet.destroy
    redirect_to root_path
  end


  private

  def tweet_params
    params.require(:tweet).permit(:energy_id,:food_id,:toilet_id,:poop_status_id,:exercise_id,:sleep_id,:different_id,:memo,:start_time,:image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
    if @tweet.user_id != current_user.id
      redirect_to action: :index
    end
  end

end

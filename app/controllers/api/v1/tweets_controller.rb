class Api::V1::TweetsController < ApplicationController
  def index
    render json: Tweet.all, methods: [:image_url]
  end

  def create
    tweet = Tweet.new(tweet_params)
    if post.save
      render json: tweet, methods: [:image_url]
    else
      render json: tweet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy!
    render json: tweet
  end

  private
  def tweet_params
    params.permit(:content, :image)
  end
end

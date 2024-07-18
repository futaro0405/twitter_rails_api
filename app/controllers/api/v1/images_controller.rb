class Api::V1::ImagesController < ApplicationController
  def create
    tweet = current_api_v1_user.tweets.find(params[:tweet_id])
    if tweet.present?
      blob = ActiveStorage::Blob.create_and_upload!(
        io: StringIO.new(decode(params[:data])),
        filename: params[:filename]
      )
      tweet.images.attach(blob)
      if tweet.save
        render json: { image: tweet.image }
      else
        render json: { errors: tweet.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  private
  def image_params
    params.require(:image).permit(:tweet_id, :data, :filename)
  end

  def decode(str)
    Base64.decode64(str.split(',').last)
  end
end

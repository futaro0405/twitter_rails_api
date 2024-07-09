# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        user = User.find_by(name: params[:name])
        if user
          render json: user
        else
          render json: { message: 'ユーザーが見つかりませんでした' }, status: :not_found
        end
      end

      private

      def user_params
        params.require(:user).permit(
          :name,
          :nickname,
          :email,
          :phone,
          :birthdate,
          :introduction,
          :place,
          :website,
          :password,
          :password_confirmation
        )
      end
    end
  end
end

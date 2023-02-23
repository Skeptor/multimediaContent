# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: :library

      def library
        user_content = @user.purchases.where('expiration_date > ?', DateTime.now).order(:expiration_date)

        render json: user_content, status: 200
      end

      private

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end

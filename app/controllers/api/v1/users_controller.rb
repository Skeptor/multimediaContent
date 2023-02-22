# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: :library

      def library
        library = []
        user_content = Purchase.where(user_id: @user.id).where('expiration_date > ?', DateTime.now)
        add_to_library(library, Movie.where(id: user_content.select(:content_id).where(content_type: 'Movie')))
        add_to_library(library, Season.where(id: user_content.select(:content_id).where(content_type: 'Season')))

        render json: library, status: 200
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def add_to_library(content, objectList)
        objectList.each do |o|
          content << if o.has_attribute?('number')
                       { title: o.title, plot: o.plot, number: o.number }
                     else
                       { title: o.title, plot: o.plot }

                     end
        end
      end
    end
  end
end

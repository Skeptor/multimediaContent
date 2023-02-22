class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: :library

    def library
        library = []
        user_content = Library.where(user_id: @user.id).where('expiration_date > ?', DateTime.now)
        add_to_library(library, Movie.where(id: user_content.select(:content_id).where(content_type: "Movie")))
        add_to_library(library, Season.where(id: user_content.select(:content_id).where(content_type: "Season")))

        render json: library, status:200
    end

    private
    
    def set_user
        @user = User.find(params[:id])
    end

    def add_to_library(content, objectList)
        objectList.each do |o|
            if(o.has_attribute?('number'))
                content << { title: o.title, plot: o.plot, number: o.number }
            else
                content << { title: o.title, plot: o.plot, }
    
            end
        end
    end
end

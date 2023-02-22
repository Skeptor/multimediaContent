class Api::V1::ContentsController < ApplicationController

    def index
        @content = []
        add_to_content(@content, Movie.all)
        add_to_content(@content, Season.all)

        render json: @content.sort_by{|c| c[:created_at]}, status:200
    end

    private
    
    def add_to_content(content, objectList)
        objectList.each do |o|
            if(o.has_attribute?('number'))
                content << { title: o.title, plot: o.plot, number: o.number, created_at: o.created_at }
            else
                content << { title: o.title, plot: o.plot, created_at: o.created_at }
    
            end
        end
    end
end
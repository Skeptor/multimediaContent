class Api::V1::ContentsController < ApplicationController

    def index
        @content = []
        addToContent(@content, Movie.all)
        addToContent(@content, Season.all)

        render json: @content.sort_by{|c| c[:created_at]}, status:200
    end

    def purchase(content_id, content_class, user_id)
        
        if(@content = Library.find(user_id, content_id, content_class))
            Library.update(user_id: user_id, content_id: content_id, content_type: content_class)
        else
            Library.create(user_id: user_id, content_id: content_id, content_type: content_class)
        end
    end

    private
    def addToContent(content, objectList)
        objectList.each do |o|
            if(o.has_attribute?('number'))
                content << { :title => o.title, :plot => o.plot, :number => o.number, :created_at => o.created_at }
            else
                content << { :title => o.title, :plot => o.plot, :created_at => o.created_at }
    
            end
        end
    end
end
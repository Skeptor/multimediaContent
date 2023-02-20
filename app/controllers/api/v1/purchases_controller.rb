class Api::V1::PurchasesController < ApplicationController
    
    def index
        if(@content = Library.find_by(user_id: params[:user_id], content_id: params[:content_id], content_type: params[:content_type]))
        
        if(@content.expiration_date > DateTime.now)
            render json: {error: "The #{@content.content_type} is alive in the user library."}
        end

        @content.expiration_date = DateTime.now + 2.days
        @content.save
        else
        Library.create(user_id: params[:user_id], content_id: params[:content_id], content_type: params[:content_type], video_quality: params[:video_quality], expiration_date: DateTime.now + 2.days)
        end
    end
end
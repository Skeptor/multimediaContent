class Api::V1::PurchasesController < ApplicationController
    
    def index
        if(@content = Library.find_by(user_id: params[:user_id], content_id: params[:content_id], content_type: params[:content_type]))
        
            if(@content.expiration_date > DateTime.now)
                return render json: {error: "The #{@content.content_type} is alive in the user library."}
            end

        @content.expiration_date = DateTime.now + 2.days
            if @content.save
                render json: { response: "The #{@content.content_type} has been updated in user library"}, status: 200
            else
                render json: {error: "The #{@content.content_type} couldn\'t be saved in user library."}
            end
        else
            Library.create(user_id: params[:user_id], content_id: params[:content_id], content_type: params[:content_type], video_quality: params[:video_quality], expiration_date: DateTime.now + 2.days)
            render json: {response: "The #{params[:content_type]} has been added to user library"}, status: 200
        end
    end
end
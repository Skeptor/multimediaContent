# frozen_string_literal: true

module Api
  module V1
    class PurchasesController < ApplicationController
      before_action :ensure_purchase_params, only: :create

      def create
        if (@purchase = Purchase.find_by(ensure_purchase_params))

          if @purchase.expiration_date > DateTime.now
            return render json: { error: "The #{@purchase.content_type} is alive in the user library." }, status: 400
          end

          @purchase.expiration_date = DateTime.now + 2.days
          if @purchase.save
            render json: { response: "The #{@purchase.content_type} has been updated in user library." }, status: 200
          else
            render json: { error: "The #{@purchase.content_type} couldn\'t be saved in user library." }, status: 400
          end
        else
          @purchase = Purchase.new(ensure_purchase_params)
          if @purchase.save
            render json: { response: "The #{params[:content_type]} has been added to user library." }, status: 200
          else
            render json: { error: "The #{@purchase.content_type} couldn\'t be saved in user library." }, status: 400
          end
        end
      end

      private

      def ensure_purchase_params
        params.permit(:user_id, :content_id, :content_type, :video_quality)
      end
    end
  end
end

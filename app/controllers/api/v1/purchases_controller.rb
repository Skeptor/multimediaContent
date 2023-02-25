# frozen_string_literal: true

module Api
  module V1
    class PurchasesController < ApplicationController
      before_action :ensure_purchase_params, only: :create

      def create
        if (@purchase = Purchase.find_by(purchase_params))
          purchase_expired_content(@purchase)
        else
          purchase_new_content(purchase_params)
        end
      end

      private

      def purchase_expired_content(purchase)
        if purchase.expiration_date > DateTime.now
          return render json: { error: "The #{purchase.content_type} is alive in the user library." }, status: 400
        end

        purchase.expiration_date = DateTime.now + Purchase::EXPIRATION_TIME

        if @purchase.save
          render json: { response: "The #{purchase.content_type} has been updated in user library." }, status: 200
        else
          render json: { error: "The #{purchase.content_type} couldn\'t be updated in user library." }, status: 400
        end
      end

      def purchase_new_content(purchase_params)
        purchase = Purchase.new(purchase_params)

        if purchase.save
          render json: { response: "The #{purchase_params[:content_type]} has been added to user library." },
                 status: 200
        else
          render json: { error: "The #{purchase.content_type} couldn\'t be saved in user library." }, status: 400
        end
      end

      def ensure_purchase_params
        params.require(%i[user_id content_id content_type purchase_option_id])
      end

      def purchase_params
        params.permit(:user_id, :content_id, :content_type, :purchase_option_id)
      end
    end
  end
end

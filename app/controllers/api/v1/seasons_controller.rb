# frozen_string_literal: true

module Api
  module V1
    class SeasonsController < ApplicationController
      before_action :set_season, only: %i[show update destroy]

      def index
        @seasons = Season.includes(:episodes).order(:created_at).all
        render json: @seasons.to_json(include: :episodes), status: 200
      end

      def show
        if @season
          render json: @season, status: 200
        else
          render json: { error: 'Season Not Found.' }
        end
      end

      def create
        @season = Season.new(season_params)

        if @season.save
          render json: season, status: 200
        else
          render json: { error: "Error creating season #{@season.title} #{@season.number}" }
        end
      end

      def update
        if @season.update(season_params)
          render json: season, status: 200
        else
          render json: { error: "Error updating season #{@season.title}" }
        end
      end

      def destroy
        @season.destroy
      end

      private

      def set_season
        @season = Season.find(params[:id])
      end

      def season_params
        params.permit(:title, :plot, :number)
      end
    end
  end
end

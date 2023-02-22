# frozen_string_literal: true

module Api
  module V1
    class EpisodesController < ApplicationController
      before_action :set_episode, only: %i[show update destroy]
      before_action :get_season

      def index
        episodes = @season.episodes
        render json: episodes, status: 200
      end

      def show
        if @episode
          render json: @episode, status: 200
        else
          render json: { error: 'Episode Not Found.' }
        end
      end

      def create
        @episode = @season.comments.build(episode_params)

        if @episode.save
          render json: episode, status: 200
        else
          render json: { error: "Error creating episode #{@episode.title} #{@episode.number}" }
        end
      end

      def update
        if @episode.update(episode_params)
          render json: episode, status: 200
        else
          render json: { error: "Error updating episode #{@episode.title}" }
        end
      end

      def destroy
        @episode.destroy
      end

      private

      def set_episode
        @episode = Episode.find(params[:id])
      end

      def get_season
        @season = Season.find(params[:season_id])
      end

      def episode_params
        params.require(:episode).permit(:title, :plot, :number, :season_id)
      end
    end
  end
end

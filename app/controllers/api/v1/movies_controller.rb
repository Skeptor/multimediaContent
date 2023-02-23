# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: %i[show update destroy]

      def index
        movies = Movie.all.order(:created_at)
        render json: movies, status: 200
      end

      def show
        if @movie
          render json: @movie, status: 200
        else
          render json: { error: 'Movie Not Found.' }
        end
      end

      def create
        @movie = Movie.new(movie_params)

        if @movie.save
          render json: @movie, status: 200
        else
          render json: { error: "Error creating movie #{@movie.title}" }
        end
      end

      def update
        if @movie.update(movie_params)
          render json: @movie, status: 200
        else
          render json: { error: "Error updating movie #{@movie.title}" }
        end
      end

      def destroy
        @movie.destroy
      end

      private

      def set_movie
        @movie = Movie.find(params[:id])
      end

      def movie_params
        params.permit(:title, :plot)
      end
    end
  end
end

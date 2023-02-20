class Api::V1::MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  def index
    movies = Movie.all.order(:created_at)
    render json: movies, status: 200
  end

  def show
    if @movie
      render json: @movie, status:200
    else
      render json: {error: "Movie Not Found."}
    end
  end

  def purchase
    if(@content = Library.find_by(user_id: params[:user_id], content_id: params[:movie_id], content_type: "Movie"))
      
      if(@content.expiration_date > DateTime.now)
        render json: {error: "The movie is alive in the user library."}
      end

      @content.expiration_date = DateTime.now + 2.days
      @content.save
    else
      Library.create(user_id: params[:user_id], content_id: params[:movie_id], content_type: "Movie", expiration_date: DateTime.now + 2.days)
    end
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: movie, status:200      
    else
      render json: {error: "Error creating movie " + @movie.title }
    end
  end

  def update
    if @movie.update(movie_params)
      render json: movie, status:200
    else
      render json: {error: "Error updating movie " + @movie.title }
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
    params.require(:movie).permit(:title, :plot)
  end
end

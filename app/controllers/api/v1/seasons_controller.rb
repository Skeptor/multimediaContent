class Api::V1::SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :update, :destroy]

  def index
    @seasons = Season.includes(:episodes).order(:created_at).all
    render json: @seasons.to_json(include: :episodes), status: 200
  end

  def show
    if @season
      render json: @season, status:200
    else
      render json: {error: "Season Not Found."}
    end
  end

  def create
    @season = Season.new(season_params)
    
    if @season.save
      render json: season, status:200  
    else
      render json: {error: "Error creating season " + @season.title + " " + @season.number }
    end
  end

  def update
    if @season.update(season_params)
      render json: season, status:200
    else
      render json: {error: "Error updating season " + @season.title }
    end
  end

  def destroy
    @season.destroy
  end

  def purchase
    if(@content = Library.find_by(user_id: params[:user_id], content_id: params[:season_id], content_type: "Season"))
      
      if(@content.expiration_date > DateTime.now)
        render json: {error: "The season is alive in the user library."}
      end

      @content.expiration_date = DateTime.now + 2.days
      @content.save
    else
      Library.create(user_id: params[:user_id], content_id: params[:season_id], content_type: "Season", expiration_date: DateTime.now + 2.days)
    end
  end

  private

  def set_season
    @season = Season.find(params[:id])
  end

  def season_params
    params.require(:season).permit(:title, :plot, :number)
  end
end

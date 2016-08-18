class Api::V1::SportsController < ApplicationController

  def index
    @sports = Sport.all
  end

  def show
    @sport = Sport.find_by(id: params[:id])
    render json: @sport 
  end

  def  create
    @sport = Sport.new(name: params[:name], players: params[:players], country_of_origin: params[:country_of_origin])
    @sport.save
    render :show
  end

  def update
    @sport = Sport.find_by(id: params[:id])
    @sport.assign_attributes(name: params[:name], players: params[:players], country_of_origin: params[:country_of_origin])
    @sport.save
    render :show
  end

  def destroy
    @sport = Sport.find_by(id: params[:id])
    @sport.destroy
    render json: {message: "employee fired"} 
  end
  
end

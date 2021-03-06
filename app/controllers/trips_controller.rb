class TripsController < ApplicationController
  def index
    @trips = Trip.all.order(:created_at)

    render json: @trips
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  def show
    # TODO: handle not found
    @trip = Trip.find(params[:id])
    render json: @trip
  end

private

  def trip_params
    params.require(:trip).permit(:name)
  end
end

class TripsController < ApplicationController
  def index
    @trips= Trip.all.order(:created_at)

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

  # def update
    # @item = Item.find(params[:id])
    # if @item.update(item_params)
      # render json: @item
    # else
      # render json: @item.errors, status: :unprocessable_entity
    # end
  # end

  # def destroy
    # @item = Item.find(params[:id])
    # @item.destroy
    # head :no_content
  # end

private

  def trip_params
    params.require(:trip).permit(:name)
  end
end

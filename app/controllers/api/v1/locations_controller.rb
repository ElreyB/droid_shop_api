class Api::V1::LocationsController < ApplicationController

  include Response

  def index
    @locations = Location.paginate(:page => params[:page], :per_page => 10)
    planet = params[:planet]
    galaxy = params[:galaxy]
    if planet
      @locations = Location.search_by_planet(planet)
    end
    if galaxy
      @locations = Location.search_by_galaxy(galaxy)
    end
    json_response(@locations)
  end

  def show
    @location = Location.find(params[:id])
    json_response(@location)
  end

  def create
    @location = Location.create!(location_params)
    json_response(@location, :created)
  end

  def update
    @location = Location.find(params[:id])
    if @location.update!(location_params)
      render status: 200, json: {
        message: "Your location has been updated successfully!"
      }
    end
  end

  def destroy
    @location = Location.find(params[:id])
    if @location.destroy!
      render status: 200, json: {
        message: "Location has been deleted successfully!"
      }
    end
  end

  private

  def location_params
    params.permit(:planet, :galaxy)
  end
end

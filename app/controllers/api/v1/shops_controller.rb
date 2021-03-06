class Api::V1::ShopsController <  ApplicationController
  include Response

  def index
    @shops = Shop.all
    location_id = params[:location_id]
    owner = params[:owner]
    rating = params[:rating]
    name = params[:name]
    droid = params[:droid]
    random = params[:random]
    if location
      @shops = Shop.shops_by_location(location_id)
    end
    if owner
      @shops = Shop.search_by_owner(owner)
    end
    if name
      @shops = Shop.search_by_name(name)
    end
    if rating
      @shops = Shop.search_by_rating(rating)
    end
    if droid
      @shops = Shop.search_by_droid(droid)
    end
    if random
      @shops = Shop.random_shop
    end
    json_response(@shops)
  end

  def show
    @location = Location.find(params[:location_id])
    @shop = @location.shops.find(params[:id])
    json_response(@shop)
  end

  def create
    @location = Location.find(params[:location_id])
    @shop = @location.shops.create!(shop_params)
    json_response(@shop, :created)
  end

  def update
    @location = Location.find(params[:location_id])
    @shop = @location.shops.find(params[:id])
    user_name = @shop.owner
    # This should correlate with current user of app
    owner = params[:owner]
    if owner == user_name
      if @shop.update!(shop_params)
        render status: 200, json: {
          message: "Your shop has been updated successfully!"
        }
      end
    else
      render status: 404, json: {
        message: "You are not authorized to do this."
      }
    end
  end

  def destroy
    @location = Location.find(params[:location_id])
    @shop = @location.shops.find(params[:id])
    user_name = @shop.owner
    # This should correlate with current user of app
    owner = params[:owner]
    if owner == user_name
      if @shop.destroy!
        render status: 200, json: {
          message: "Your shop has been deleted successfully!"
        }
      end
    else
      render status: 404, json: {
        message: "You are not authorized to do this."
      }
    end
  end

private

  def shop_params
    params.permit(:name, :owner, :motto, :rating, :droid)
  end

end

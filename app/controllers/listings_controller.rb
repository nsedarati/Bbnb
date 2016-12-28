class ListingsController < ApplicationController
  before_action :set_listing, only: [:show,:edit,:update]
  before_action :require_login, except: [:show]
  def index
    # @listings = current_user.listings.paginate(:page => params[:page], :per_page => 10)
    @listings = Listing.all.paginate(:page => params[:page], :per_page => 10)
  end

  def show

  end

  def new
    @listing = current_user.listings.build
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to @listing, notice: "Saved..."
    else
      render :new
    end
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: "Updated..."
    else
      render :edit
    end
  end

  private
  def set_listing
    @listing  = Listing.find(params[:id])
  end
  def listing_params
    params.require(:listing).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_internet, :is_smoker, :is_pet, :price, :active)

  end
end

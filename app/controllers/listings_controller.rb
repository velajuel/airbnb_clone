
class ListingsController < ApplicationController
  
  def index

    if params[:search]
      @listing_search = Listing.search(params[:search]).order("created_at DESC")
    end

  	@listing = Listing.all.where(user_id: params[:user_id])
    @listing = Listing.paginate(:page => params[:page], :per_page => 5)
    unless @listing.empty?
    else
  		@listing = "You have no new listings!"
  	end 

    @full_list = Listing.all
    @full_list=Listing.paginate(:page => params[:page], :per_page => 5)

    @reservation = Reservation.all.where(user_id: current_user.id)
    if @reservation.empty?
      @reservation = "You have no reservations."
    else
      @reservation
    end

end

  def create
  	@listing = current_user.listings.new(listing_params)
	@listing.save
	redirect_to user_listings_path
	end


   def new
    @listing = Listing.new
  end

  def destroy
    @delete_listing=Listing.find(params[:id])
    @delete_listing.destroy
    redirect_to user_listings_path
  end

  def show
  end

  def edit
    @editlist = Listing.find(params[:id])
  end

  def update
    @edit_list = Listing.find(params[:id])
    @edit_list.update(property_type: params[:listing][:property_type], description: params[:listing][:description], price: params[:listing][:price])
    redirect_to user_listings_path
  end

  def verify
    Listing.find(params[:id]).update(verification: "verified")
    redirect_to user_listings_path(params[:user_id])
  end

  def show 
    @show = Listing.find(params[:id])
  end

  private

  def listing_params
    params.require(:listing).permit(:property_type, :description, :price, {avatars: []})
  end
#   def index
#   @listings = Listing.all.where(user_id: params[:user_id])
#   if params[:search]
#     @listings = Listing.search(params[:search]).order("created_at DESC")
#   else
#     @listings = Listing.all.order("created_at DESC")
#   end
# end

  end
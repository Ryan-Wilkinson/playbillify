class AdsController < ApplicationController

  def index
    @ads = Ad.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @ad = Ad.find(params[:id])
  end

  # GET /events/new
  def new
    @organization = Organization.find(params[:organization_id])
    @event = Event.find(params[:event_id])
    @ad = Ad.new
  end

  def create
    @ad = Ad.create(
    	size: ad_params[:size],
    	price: ad_params[:price],
    	photo_url: ad_params[:photo_url],
    	dimensions: ad_params[:dimensions],
    	advertiser_id: ad_params[:advertiser_id],
    	event_id: ad_params[:event_id]
    	)
    @event = @ad.event
    @organization = @event.organization
    redirect_to "/organizations/#{@organization.id}/events/#{@event.id}"
  end

  # GET /events/1
  def show
    @ad = Ad.find(params[:id])
  end

  # GET /events/1/edit
  def edit
    @ad = Ad.find(params[:id])
    @event = @ad.event
    @organization = @ad.event.organization
  end

  def update
    @ad = Ad.find(params[:id])
    @event = @ad.event
    @organization = @ad.event.organization
    @ad.update(ad_params)
    redirect_to "/organizations/#{@organization.id}/events/#{@event.id}"
  end

  # DELETE /events/1
  def destroy
    @ad = Ad.find(params[:id])
    @event = @ad.event
    @organization = @event.organization
    @ad.destroy
    redirect_to "/organizations/#{@organization.id}/events/#{@event.id}"
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad)
        .permit(:size, :price, :advertiser_id, :event_id, :photo_url, :dimensions)
        .merge(event_id: params[:event_id])
    end
end








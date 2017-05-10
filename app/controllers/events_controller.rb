class EventsController < ApplicationController
  load_and_authorize_resource :organization
  load_and_authorize_resource :event, :through => :organization

  def index
    @user = current_user
    @organizations = @user.organizations
  end

  # GET /events/new
  def new
  	@organization = Organization.find(params[:organization_id])
    @event = Event.new
  end

  # GET /events/1
  def show
  	@event = Event.find(params[:id])
    @all_ads = @event.ads
    @sold_ads = Ad.where(event: @event).where.not(advertiser_id: nil)
    @sold_ad_prices = Ad.select(:price).where(event: @event).where.not(advertiser_id: nil)
    calculate_revenue(@sold_ads)
  end

  # POST /events
  def create
  	@event = Event.create(event_params)
  	@organization = @event.organization
  	redirect_to "/organizations/#{@organization.id}/events/#{@event.id}"
  end

  # GET /events/1/edit
  def edit
		@event = Event.find(params[:id])
		@organization = @event.organization
  end

  def update
  	@event = Event.find(params[:id])
  	@organization = @event.organization
  	@event.update(event_params)
  	redirect_to "/organizations/#{@organization.id}/events/#{@event.id}"
  end

  # DELETE /events/1
  def destroy
  	@event = Event.find(params[:id])
  	@organization = @event.organization
    @event.destroy
    redirect_to "/organizations/#{@organization.id}"
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event)
        .permit(:name, :city, :state, :event_image, :start_date, :end_date, :deadline, :estimated_attendees, :venue, :description)
        .merge(organization_id: params[:organization_id])
    end

    def calculate_revenue(sold_ads)
      sold_ad_prices = []
      sold_ads.each do |ad|
      sold_ad_prices.push(ad.price)
      end
      @revenue = sold_ad_prices.reduce(0, :+)
    end
end








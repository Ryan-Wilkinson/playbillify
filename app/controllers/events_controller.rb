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
    @sellers = Ad.select(:seller).where(event: @event).where.not(seller: "")
  end

  # POST /events
  def create
    sellers_list = event_params[:sellers].split("\r\n")
    org_id = params[:organization_id]
  	@event = Event.create(
      :name => event_params[:name],
      :city => event_params[:city],
      :state => event_params[:state],
      :event_image => event_params[:event_image],
      :start_date => event_params[:start_date],
      :end_date => event_params[:end_date],
      :deadline => event_params[:deadline],
      :estimated_attendees => event_params[:estimated_attendees],
      :venue => event_params[:venue],
      :description => event_params[:description],
      :sellers => sellers_list,
      :organization_id => org_id
      )
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
    org_id = params[:organization_id]
  	@event.update(:name => event_params[:name],
                  :city => event_params[:city],
                  :state => event_params[:state],
                  :start_date => event_params[:start_date],
                  :end_date => event_params[:end_date],
                  :deadline => event_params[:deadline],
                  :estimated_attendees => event_params[:estimated_attendees],
                  :venue => event_params[:venue],
                  :description => event_params[:description],
                  :organization_id => org_id
    )
  	redirect_to "/organizations/#{@organization.id}/events/#{@event.id}"
  end

  # DELETE /events/1
  def destroy
  	@event = Event.find(params[:id])
  	@organization = @event.organization
    @event.destroy
    redirect_to "/organizations/"
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params

      params.require(:event)
        .permit(:name, :city, :state, :event_image, :start_date, :end_date, :deadline, :estimated_attendees, :venue, :description, :sellers)
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








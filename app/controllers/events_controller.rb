class EventsController < ApplicationController

  # GET /events/new
  def new
  	@organization = Organization.find(params[:organization_id])
    @event = Event.new
  end

  # GET /events/1
  def show
  	@event = Event.find(params[:id])
  end

  # POST /events
  def create
  	@event = Event.create(
      name: event_params[:name],
      city: event_params[:city],
      state: event_params[:state],
      photo_url: event_params[:photo_url],
      date: event_params[:date],
      deadline: event_params[:deadline],
      estimated_attendees: event_params[:estimated_attendees],
      venue: event_params[:venue],
      description: event_params[:description],
      organization_id: params[:organization_id]
      )
  	@organization = @event.organization
  	redirect_to "/organizations/#{@organization.id}"
  end

  # GET /events/1/edit
  def edit
  end

  def update

  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event)
        .permit(:name, :city, :state, :photo_url, :date, :deadline, :estimated_attendees, :venue, :description)
        .merge(organization_id: params[:organization_id])
    end
end








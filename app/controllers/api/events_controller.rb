class Api::EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find_by(user_id: current_user.id)
    render json: @event
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(
      name: event_params[:name],
      city: event_params[:city],
      state: event_params[:state],
      venue: event_params[:venue],
      estimated_attendees: event_params[:event_attendees],
      deadline: event_params[:deadline],
      photo_url: event_params[:photo_url],
      user_id: current_user.id
)

    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end


  # def create
  #   @event = Event.create(
  #     name: event_params[:name],
  #     city: event_params[:city],
  #     state: event_params[:state],
  #     venue: event_params[:venue],
  #     estimated_attendees: event_params[:event_attendees],
  #     deadline: event_params[:deadline],
  #     photo_url: event_params[:photo_url],
  #     user_id: current_user.id
  #     )
  #   respond_to do |format|
  #     if @event.save
  #       render json: @event
  #     else
  #       render json: @event
  #     end
  #   end
  # end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = event.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event)
        .permit(:name, :city, :state, :photo_url, :date, :deadline, :estimated_attendees, :venue)
        .merge(user_id: current_user)

    end
end








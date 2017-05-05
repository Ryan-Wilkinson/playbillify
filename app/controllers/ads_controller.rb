class AdsController < ApplicationController
  before_action :set_ad, only: [:edit, :update, :destroy]

  # GET /events
  # GET /events.json
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

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @ad = Ad.create(ad_params)
    @event = @ad.event
    @organization = @event.organization
  end

  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params
        .permit(:size, :price, :advertiser_id, :event_id, :photo_url, :dimensions)
    end
end








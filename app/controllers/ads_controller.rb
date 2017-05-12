class AdsController < ApplicationController
  helper_method :keyword_search

  load_and_authorize_resource :organization
  load_and_authorize_resource :event, :through => :organization
  load_and_authorize_resource :ad, :though => :event

  def index
    @organizations = Organization.all
    identical_ads = []
    @ads = Ad.where(:advertiser_id => nil)
    @ads.each do |ad|
      identical_ads.push(ad)
    end
    @events = Event.all
    @unique_ads = identical_ads.uniq{|ad| [ad.size, ad.price, ad.event_id, ad.dimensions]}
  end

  def keyword_search
    @search = params[:search]
  end

  def add_image
    @ad = Ad.find(params[:id])
    @sellers = @ad.event.sellers
    authorize! :add_image, Ad
  end

  def purchase
    @organization = Organization.find(params[:organization_id])
    @event = Event.find(params[:event_id])
    @ad = Ad.find(params[:id])
    @advertiser_id = current_user.id
    authorize! :purchase, @ad
  end

  def purchased_ads
    @user = current_user
    @ads = Ad.where(advertiser_id: @user.id).order('updated_at DESC')
    authorize! :purchased_ads, Ad
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @event = Event.find(params[:event_id])
    @ad = Ad.new
  end

  def create
    params[:count].to_i.times do
      @ad = Ad.create(ad_params)
    end
    @event = @ad.event
    @organization = @event.organization
    redirect_to "/organizations/#{@organization.id}/events/#{@event.id}"
  end

  def show
    @ad = Ad.find(params[:id])
    @user = current_user
  end

  def edit
    if current_user.advertiser?
      redirect_to '/'
    else
      @ad = Ad.find(params[:id])
      @event = @ad.event
      @organization = @ad.event.organization
    end
  end

  def update
    @ad = Ad.find(params[:id])
    @event = @ad.event
    @organization = @ad.event.organization
    @ad.update(ad_params)
    redirect_after_ad_update
  end

  def destroy
    @ad = Ad.find(params[:id])
    @event = @ad.event
    @organization = @event.organization
    @ad.destroy
    redirect_to "/organizations/#{@organization.id}/events/#{@event.id}"
  end

  private

    def ad_params
      params.require(:ad)
        .permit(:size, :price, :advertiser_id, :event_id, :photo_url, :dimensions, :image, :seller)
        .merge(event_id: params[:event_id])
    end

    def redirect_after_ad_update
      if current_user.user_type == 'advertiser'
        if @ad.image_file_name == nil
          redirect_to "/ads/purchased-ads"
        else
          redirect_to "/ads/purchased-ads"
        end
      else
        redirect_to "/organizations/#{@organization.id}/events/#{@event.id}"
      end
    end
end








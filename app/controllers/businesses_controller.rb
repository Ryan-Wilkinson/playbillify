class BusinessesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def edit
    @business = Business.find(params[:id])
    authorize! :edit, @business
  end

  def create
    @business = Business.create(
      business_name: business_params[:business_name],
      business_address1: business_params[:business_address1],
      business_address2: business_params[:business_address2],
      business_city: business_params[:business_city],
      business_state: business_params[:business_state],
      business_zip: business_params[:business_zip],
      business_phone: business_params[:business_phone],
      user_id: current_user.id
      )
    redirect_to "/ads"
  end

  def update
    @business = Business.find(params[:id])
    @business.update(business_params)
    redirect_to "/"
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy
    redirect_to "/ads"
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business)
        .permit(:business_name, :business_address1, :business_address2, :business_city, :business_state, :business_zip, :business_phone)
        .merge(user_id: current_user.id)
      end

end

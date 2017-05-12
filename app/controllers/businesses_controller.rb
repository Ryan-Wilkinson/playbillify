class BusinessesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  load_and_authorize_resource :business

  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @states = %w(AL AK AZ AR CA CO CT DC DE FL GA HI ID IL IN IA KS KY LA ME MA MI MN MO MS MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY)
    @business = Business.new
  end

  def edit
    @business = Business.find(params[:id])
    authorize! :edit, @business
  end

  def create
    @business = Business.create(business_params)
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

class OrganizationsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /organizations
  def index
    @organizations = Organization.where(user_id: current_user.id)
  end

  # GET /organizations/1
  def show
    @organization = Organization.find(params[:id])
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  	@organization = Organization.find(params[:id])
  end

  # POST /organizations
  def create
    @organization = Organization.create(organization_params)
    redirect_to "/organizations/#{@organization.id}"
  end

  # PATCH/PUT /organizations/1
  def update
  	@organization = Organization.find(params[:id])
  	@organization.update(organization_params)
  	redirect_to "/organizations"
  end

  # DELETE /organizations/1
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to "/organizations"
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization)
        .permit(:name, :city, :state, :logo, :description, :business_street1, :business_street2, :business_phone)
        .merge(user_id: current_user.id)
    end
end




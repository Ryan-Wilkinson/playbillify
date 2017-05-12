class ChargesController < ApplicationController
  def new
    @ad = Ad.find(params[:id])
    event = @ad.event
    @sellers = event.sellers
    @event = @ad.event
    @organization = @event.organization
    @amount = @ad.price.to_i
    @description = "#{@ad.size}: #{@event.name}"
  end

  def create
    # Amount in cents
    ad = Ad.find(params[:id])
    amount = ad.price.floor

    # Create the customer in Stripe
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card: params[:stripeToken]
    )

    # Create the charge using the customer data returned by Stripe API
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount * 100,
      description: "#{ad.size} Ad: #{ad.event.name} (Playbillify)",
      currency: 'usd'
    )
    charge_error = nil

      if charge_error
        flash[:error] = charge_error
        redirect_to ads_new_charge_path(ad.id)
      else
        claim_ad(ad.id)
      end
    else
      flash[:error] = 'one or more errors in your order'
  end


private

  def claim_ad(id)
    @ad = Ad.find(id)
    @event = @ad.event.id
    @organization = @ad.event.organization.id
    @ad.update(advertiser_id: current_user.id)
    redirect_after_ad_update
  end

  def redirect_after_ad_update
    if current_user.user_type == 'advertiser'
      if @ad.image_file_name == nil
        redirect_to ads_add_image_path(@ad)
      else
        redirect_to "/ads/purchased-ads"
      end
    else
      redirect_to "/organizations/#{@organization.id}/events/#{@event.id}"
    end
  end

end

class ChargesController < ApplicationController
  def new
    @ad = Ad.find(params[:id])
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
        redirect_to ads_purchased_ads_path
      end
    else
      flash[:error] = 'one or more errors in your order'
    end


private

  def claim_ad(id)
    ad = Ad.find(id)
    ad.update(advertiser_id: current_user.id)
  end
end

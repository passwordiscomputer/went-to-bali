class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = current_order.total_price.to_i

    if current_user
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount * 100,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )

      current_order.finalize(current_user)
      session[:order_id] = nil
    else
      flash[:alert] = "You need to sign up or sign in to complete your order."
      redirect_to sign_in_path
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to redirect_to cart_path
  end
end

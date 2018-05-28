class PaymentsController < ApplicationController
  def new
    # Render the form where the user will enter credit card info
    @order = Order.find(params[:order_id])
  end

  def create
    @order = Order.find(params[:order_id])

    # This action is called by Stipe servers
    # provide verification information 

    # Call the Stripe API
      # Create a customer
      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  params[:stripeEmail]
      )

      # Charge their credit card
      charge = Stripe::Charge.create(
        customer:     customer.id,
        amount:       @order.amount_cents,
        description:  "Payment for teddy #{@order.teddy_sku} for order #{@order.id}",
        currency:     @order.amount.currency
      )

      @order.update(payment: charge.to_json, state: 'paid')
      redirect_to order_path(@order)
  end
end

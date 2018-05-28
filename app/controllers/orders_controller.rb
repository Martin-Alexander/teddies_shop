class OrdersController < ApplicationController
  def show
    # We'll get to this at the end...
    @order = Order.find(params[:id])
  end

  def create
    # Recived order information
    teddy = Teddy.find(params[:id])
    
    # Create an order
    order = Order.create(
      teddy_sku: teddy.sku,
      user: current_user,
      amount_cents: teddy.price_cents,
      state: "pending"
    )

    # Redirect to some payment form where I can enter credit card info
    redirect_to new_order_payment_path(order)
  end
end

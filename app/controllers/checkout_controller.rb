class CheckoutController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    order.sneakers.map do |sneaker|
      { price: sneaker.stripe_pricing_id, quantity: 1, description: sneaker.title }
    end
    session = Stripe::Checkout::Session.create({
      cancel_url: order_url(order),
      success_url: root_url,
      mode: 'payment',
      payment_method_types: ['card'],
      line_items: prices
    })

    redirect_to session.url
  end
end

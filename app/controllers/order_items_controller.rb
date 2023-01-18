class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    order_item = current_order.order_items.new(sneaker_id: params[:sneaker_id])
    if order_item.save
      redirect_to current_orders_path, notice: 'Agregado al carrito con exito'
    else
      puts order_item.errors
      redirect_to sneakers_url(id: params[:sneaker_id]), alert: 'Error al agregar al carrito.'
    end
  end

  private

  def current_order
    order = Order.where(user_id: current_user.id, status: true).order(updated_at: :desc).first
    order || Order.create(user_id: current_user.id)
  end
end

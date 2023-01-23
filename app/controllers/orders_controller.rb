class OrdersController < ApplicationController
  before_action :authenticate_user!

  def current
    @order = Order.where(user_id: current_user.id, status: true).last
    @order ||= Order.create(user_id: current_user.id)
    render :show
  end

  def show
    @order = Order.find(params[:id])
  end
end

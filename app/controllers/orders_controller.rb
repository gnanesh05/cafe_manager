class OrdersController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    if current_user
      @orders = Order.of_user(current_user)
      order = Order.current_order(current_user)
      @order = order
      @order_items = OrderItem.where("order_id = ?", order.id)

      render "index"
    else
      redirect_to users_path
    end
  end

  def update
    id = params[:id]
    order = Order.find(id)
    order.status = "placed"
    order.save!
    redirect_to orders_path
  end

  def destroy
    id = params[:id]
    order = Order.of_user(current_user).find(id)
    order.destroy
    redirect_to menus_path
  end
end

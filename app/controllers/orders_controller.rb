class OrdersController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    if @current_user.role == "user"
      @orders = Order.of_user(current_user)
      render "index"
    end
    if @current_user.role == "clerk"
      @orders = Order.pending_orders
      render "index"
    end
    if @current_user == nil
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

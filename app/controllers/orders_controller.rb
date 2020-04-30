class OrdersController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    if current_user
      @orders = Order.of_user(current_user)
      order = Order.current_order(current_user)
      @order_items = OrderItem.where("order_id = ?", order.id)

      render "index"
    else
      redirect_to users_path
    end
  end
end

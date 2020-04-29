class OrdersController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    if current_user
      @orders = Order.of_user(current_user)
      order = Order.find_by("user_id = ? and status = ?", current_user.id, "not placed")
      @order_items = OrderItem.where("order_id = ?", order.id)

      render "index"
    else
      redirect_to users_path
    end
  end
end

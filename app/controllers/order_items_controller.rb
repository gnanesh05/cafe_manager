class OrderItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :ensure_user_logged_in

  def update
    id = params[:id]
    item = MenuItem.find(id)
    order = Order.current_order(current_user)
    cart_item = OrderItem.new(
      menu_item_id: id,
      menu_item_name: item.name,
      menu_item_price: item.price,
      quantity: params[:quantity],
      order_id: order.id,
    )
    if !cart_item.save
      flash[:error] = cart_item.errors.full_messages.join(", ")
      redirect_to menu_items_path
    end
  end

  def destroy
    id = params[:id]
    order_item = OrderItem.find(id)
    order_item.destroy
    redirect_to orders_path
  end
end

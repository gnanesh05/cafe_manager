class OrderItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :ensure_user_logged_in

  def update
    id = params[:id]
    item = MenuItem.find(id)
    order = Order.find_order
    cart_item = OrderItem.create!(
      menu_item_id: id,
      menu_item_name: item.name,
      menu_item_price: item.price,
      quantity: params[:quantity],
      order_id: order.id,
    )
  end
end

class MenuItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in

  def index
    render "index"
  end

  def create
  end
end

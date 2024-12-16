class ApplicationController < ActionController::Base
  before_action :set_current_cart

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def set_current_cart
    if session[:current_cart_id]
      @current_cart = Cart.find_by_uid(session[:current_cart_id])
    else
      @current_cart = Cart.create
      session[:current_cart_id] = @current_cart.uid
    end
  end
end

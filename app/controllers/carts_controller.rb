class CartsController < ApplicationController
  before_action :set_item, only: [:create, :destroy]
  def create
    @cart_item = @current_cart.cart_items.find_or_initialize_by(item_id: @item.id)
    @cart_item.quantity ||= 0
    @cart_item.quantity += 1

    if @cart_item.save
      redirect_to cart_path(@current_cart), notice: "#{@item.name} added to your cart."
    else
      redirect_to items_path, alert: "Failed to add item to your cart."
    end
  end

  def show
    @cart_items = @current_cart.cart_items
    @total_price = @current_cart.total_price
    @context = :cart_page
  end

  def destroy
    @cart_item = @current_cart.cart_items.find_by(item_id: params[:item_id])

    if @cart_item
      if @cart_item.quantity > 1
        @cart_item.quantity -= 1
        @cart_item.save
        redirect_to cart_path(@current_cart), notice: "Removed one of #{@cart_item.item.name} in your cart."
      else
        @cart_item.destroy
        redirect_to cart_path(@current_cart), notice: "#{@cart_item.item.name} removed from your cart."
      end
    else
      redirect_to cart_path(@current_cart), alert: "Item not found in your cart."
    end
  end

  private

  def set_item
    @item = Item.find_by(id: params[:item_id])
    unless @item
      redirect_to items_path, alert: "Item not found."
    end
  end
end
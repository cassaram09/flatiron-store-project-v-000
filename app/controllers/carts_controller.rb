class CartsController < ApplicationController
  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def checkout
    cart = current_user.current_cart
    cart.checkout
    cart.status = "submitted"
    cart.save
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(cart)
  end
end
class CartsController < ApplicationController
  def show
    @cart = current_user.current_cart
  end

  def checkout
    cart = Cart.find params[:id]
    cart.checkout
    redirect_to cart_path(cart)
  end
end
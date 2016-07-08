class CartsController < ApplicationController
  def show
    @cart = current_user.current_cart
  end

  def checkout
    cart = current_user.current_cart
    cart.checkout
    redirect_to cart_path(cart)
  end
end
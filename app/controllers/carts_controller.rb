class CartsController < ApplicationController
  def clean
   current_cart.clean!
   flash[:warning] = "Deleted All"
   redirect_to carts_path
 end 
end

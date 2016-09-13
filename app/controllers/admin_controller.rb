class AdminController < ApplicationController
    def dashboard
        if not current_user
            redirect_to :root
        elsif current_user.position != 'admin'
            redirect_to :client_dashboard
        end

        @categories = Category.all
        @products = Product.all
        @orders = Order.all
        @carts = Cart.all
        @offers = Offer.all
    end
end

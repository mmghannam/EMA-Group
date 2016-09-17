class AdminController < ApplicationController
    before_action :admin_authenticated?

    def admin_authenticated?
        unless is_admin?
            redirect_to :root
        end
    end

    def dashboard
        @categories = Category.all
        @products = Product.all
        @users = User.all
        @carts = Cart.where(:placed => true)
        @offers = Offer.all
    end
end

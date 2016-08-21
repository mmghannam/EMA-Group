class ClientController < ApplicationController
  def default
    @parent_categories = Category.where(parent_id: nil)
    # @featured_products =
    @new_arrivals = Product.order(created_at: :desc).limit(10)
  end
end

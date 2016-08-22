class ClientController < ApplicationController
  def default
    @parent_categories = Category.where(parent_id: nil)
    @featured_products = Product.find_by_sql('Select *,(select ifnull(sum(quantity) ,0)from orders where orders
                                .product_id = products.id) as sold_count   from products order by sold_count limit 4;')
    @new_arrivals = Product.order(created_at: :desc).limit(10)
  end

  def products
    @parent_categories = Category.where(parent_id: nil)
  end

  def single_product
    @product = Product.find(params[:product_id])
    @parent_categories = Category.where(parent_id: nil)
  end
end

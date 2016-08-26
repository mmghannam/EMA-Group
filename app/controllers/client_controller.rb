class ClientController < ApplicationController


  #client/default:  home page
  def default
    @parent_categories = Category.where(parent_id: nil)
    @featured_products = Product.find_by_sql('Select *,(select ifnull(sum(quantity) ,0)from orders where orders
                                .product_id = products.id) as sold_count   from products order by sold_count limit 4;')
    @new_arrivals = Product.order(created_at: :desc).limit(10)
  end

  #client/products: products page
  def products
    @parent_categories = Category.where(parent_id: nil)
  end

  #client_single_product: show single product page
  def single_product
    @product = Product.find(params[:product_id])
    @parent_categories = Category.where(parent_id: nil)
  end

  def checkout
    @cart = Cart.find(params['cart_id'])
    @orders = Cart.find(params['cart_id']).orders
  end

end

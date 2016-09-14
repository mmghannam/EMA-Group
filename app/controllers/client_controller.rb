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
    @cart = current_user.carts.where(placed: false)[0]
    @orders = @cart.orders

    if params['checkout'] and params['user_id']
      user = User.find(params['user_id'])
      @cart.placed = true
      user.carts << Cart.new

      respond_to do |format|
        if @cart.save
          format.html { redirect_to '/client/checkout?cart_id='+@cart.id.to_s, notice: 'Order was successfully placed.' }
        else
          format.html { redirect_to '/client/checkout?cart_id='+@cart.id.to_s, notice: 'Order was not successfully placed.' }
        end
      end

    end
  end

  def offers

  end

end

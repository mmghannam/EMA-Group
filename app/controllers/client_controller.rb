class ClientController < ApplicationController


  #client/default:  home page
  def default
    @parent_categories = Category.where(parent_id: nil)
    @featured_products = Product.find_by_sql('Select *,(select sum(quantity) from orders where orders
                                .product_id = products.id) as sold_count   from products order by sold_count limit 4;')
    @new_arrivals = Product.order(created_at: :desc).limit(10)
  end


  #client/products: products page
  def products
    if params[:category_id]
      @parent_categories = Category.where(id: params[:category_id])
      @products = Category.find(params[:category_id]).products_of_children
    else
      @parent_categories = Category.where(parent_id: nil)
      @products = Product.all
    end
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
          format.html { redirect_to '/client/checkout?cart_id='+@cart.id.to_s, notice: 'تمت إضافة الطلبية بنجاح' }
        else
          format.html { redirect_to '/client/checkout?cart_id='+@cart.id.to_s, notice:
              'حدثت مشكلة في إضافة الطلبية نرجو إعادة المحاولة' }
        end
      end

    end
  end

  def offers
    @offers = Offer.all
  end

end


module Admin
    class OrdersController < AdminController
        before_action :set_order, only: [:show, :edit, :update, :destroy]

        # GET /orders
        # GET /orders.json
        def index
            if params[:cart_id]
                @orders = Order.where(:cart_id => params[:cart_id])
            end
        end

        # GET /orders/1
        # GET /orders/1.json
        def show
        end

        # GET /orders/new
        def new
            @order = Order.new
            @string = 'أضف'
        end

        # GET /orders/1/edit
        def edit
            @string = 'تعديل'
        end

        # POST /orders
        # POST /orders.json
        def create
            user = User.find_by_id(order_params[:user_id])

            if user and user.carts.where(placed: false).count > 0
                cart = user.carts.where(placed: false)[0]
                cart_id = cart.id
            else
                cart = Cart.new(user_id: user.id)
                cart.price_pharmacy = 0
                cart.price_population = 0
                if cart.save
                    cart_id = cart.id
                end
            end

            @order = Order.new(quantity: order_params[:quantity], cart_id: cart_id, product_id: order_params[:product_id],
                price_population: (order_params[:quantity].to_i*Product.find(order_params[:product_id])
                                                                    .price_population.to_f),
                price_pharmacy: (order_params[:quantity].to_i*Product.find(order_params[:product_id])
                                                                  .price_pharmacy.to_f))

            if not is_client?
                respond_to do |format|
                    if @order.save
                        format.html { redirect_to admin_orders_url, notice: 'Order was successfully created.' }
                        format.json { render :show, status: :created, location: @order }
                    else
                        format.html { render :new }
                        format.json { render json: @order.errors, status: :unprocessable_entity }
                    end
                end
            else
                respond_to do |format|
                    if @order.save
                        cart.price_pharmacy = cart.sum_pharmacy
                        cart.price_population = cart.sum_population
                        cart.save
                        format.html { redirect_to client_products_url,
                            notice: 'Order of '+ @order.quantity.to_s + ' ' + Product.find(@order.product_id).name + ' was successfully created.' }
                        format.json { render :show, status: :created, location: @order }
                    else
                        format.html { redirect_to client_products_url, notice: 'Order was not created.' }
                    end
                end
            end
        end


        # PATCH/PUT /orders/1
        # PATCH/PUT /orders/1.json
        def update
            respond_to do |format|
                if @order.update(order_params)
                    format.html { redirect_to admin_orders_url, notice: 'Order was successfully updated.' }
                    format.json { render :show, status: :ok, location: @order }
                else
                    format.html { render :edit }
                    format.json { render json: @order.errors, status: :unprocessable_entity }
                end
            end
        end

        # DELETE /orders/1
        # DELETE /orders/1.json
        def destroy
            @order.destroy
            if is_client?
                cart = current_user.carts.where(placed: false)[0]
                respond_to do |format|
                    cart.price_pharmacy = cart.sum_pharmacy
                    cart.price_population = cart.sum_population
                    cart.save
                    format.html { redirect_to client_checkout_url, notice: 'Order was successfully deleted.' }
                    format.json { head :no_content }
                end
            else
                respond_to do |format|
                    format.html { redirect_to admin_orders_url, notice: 'Order was successfully destroyed.' }
                    format.json { head :no_content }
                end
            end
        end

        private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
            @order = Order.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def order_params
            params.require(:admin_order).permit(:product_id, :quantity, :cart_id, :user_id)
        end

    end
end
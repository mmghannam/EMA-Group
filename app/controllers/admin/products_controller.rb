module Admin
    class ProductsController < AdminController
        before_action :set_product, only: [:show, :edit, :update, :destroy]

        # GET /products
        # GET /products.json
        def index
            if params[:category_id]
                @products = Category.find(params[:category_id]).products
            else
                @products = Product.all
            end
        end

        # GET /products/1
        # GET /products/1.json
        def show
        end

        # GET /products/new
        def new
            @product = Product.new
            @string = 'أضف'
        end

        # GET /products/1/edit
        def edit
            @string = 'تعديل'
        end

        # POST /products
        # POST /products.json
        def create
            @product = Product.new(product_params)

            respond_to do |format|
                if @product.save
                    format.html { redirect_to admin_products_url, notice: 'Product was successfully created.' }
                    format.json { render :show, status: :created, location: @product }
                else
                    format.html { render :new }
                    format.json { render json: @product.errors, status: :unprocessable_entity }
                end
            end
        end

        # PATCH/PUT /products/1
        # PATCH/PUT /products/1.json
        def update
            respond_to do |format|
                if @product.update(product_params)
                    format.html { redirect_to admin_product_url(@product), notice: 'Product was successfully updated
.' }
                    format.json { render :show, status: :ok, location: @product }
                else
                    format.html { render :edit }
                    format.json { render json: @product.errors, status: :unprocessable_entity }
                end
            end
        end

        # DELETE /products/1
        # DELETE /products/1.json
        def destroy
            @product.destroy
            respond_to do |format|
                format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
                format.json { head :no_content }
            end
        end

        private
        # Use callbacks to share common setup or constraints between actions.
        def set_product
            @product = Product.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def product_params
            params.require(:admin_product).permit(:category_id, :name, :price_pharmacy, :price_population, :comments, :photo)
        end
    end
end
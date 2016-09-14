module Admin
    class CategoriesController < ApplicationController
        before_action :set_category, only: [:show, :edit, :update, :destroy]

        # GET /categories
        # GET /categories.json
        def index
            # client shouldn't access 'admin/categories'
            if current_user and current_user.position != 'admin' and request.original_url.include? '/admin/'
                redirect_to '/categories'
            end

            if params[:parent_id]
                @categories = Category.where(:parent_id => params[:parent_id])
            else
                @categories = Category.where(:parent_id => nil)
            end

        end

        # GET /categories/1
        # GET /categories/1.json
        def show
        end

        # GET /categories/new
        def new
            @category = Category.new
            @string = 'أضف'
        end

        # GET /categories/1/edit
        def edit
            @string = 'تعديل'
        end

        # POST /categories
        # POST /categories.json
        def create
            @category = Category.new(category_params)

            respond_to do |format|
                if @category.save
                    format.html { redirect_to @category, notice: 'Category was successfully created.' }
                    format.json { render :show, status: :created, location: @category }
                else
                    format.html { render :new }
                    format.json { render json: @category.errors, status: :unprocessable_entity }
                end
            end
        end

        # PATCH/PUT /categories/1
        # PATCH/PUT /categories/1.json
        def update
            respond_to do |format|
                if @category.update(category_params)
                    format.html { redirect_to @category, notice: 'Category was successfully updated.' }
                    format.json { render :show, status: :ok, location: @category }
                else
                    format.html { render :edit }
                    format.json { render json: @category.errors, status: :unprocessable_entity }
                end
            end
        end

        # DELETE /categories/1
        # DELETE /categories/1.json
        def destroy
            @category.destroy
            respond_to do |format|
                format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
                format.json { head :no_content }
            end
        end

        private
        # Use callbacks to share common setup or constraints between actions.
        def set_category
            @category = Category.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def category_params
            params.require(:category).permit(:parent_id, :name, :comments, :photo)
        end
    end
end
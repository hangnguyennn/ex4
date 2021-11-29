class ProductsController < ApplicationController
    before_action :find_product, only: [:show, :edit, :update, :destroy]
  
    def index
      if params[:category_tag]
        @products = Product.filter(params[:category_tag]).paginate(page: params[:page], per_page: 5).order(created_at: :desc)
      else
        @products = Product.search(params[:term]).paginate(page: params[:page], per_page: 5).order(created_at: :desc)
      end
    end

    def show
    end
    

    def new
      @product = Product.new
    end
    
  
    def create
      
      @product = Product.new(product_params)
     
      @product[:sku] = "SP1000" + Product.last[:id].next.to_s
  
      if @product.save 
       

        flash[:notice] = "Product was created successfully!"
        redirect_to products_path
      else
        render :new
      end
     sender
      
    end
    
    def edit
      
     
    end
  
    def update
      if @product.update(product_params)
        
        flash[:notice] = "Product was updated successfully!"
        redirect_to products_path
      else
        render :edit
      end
    end
  
    def destroy
      @product.destroy
      flash[:notice] = "Product was deleted successfully!"
      redirect_to products_path
    end
  
    private
    def find_product
      @product = Product.find(params[:id])
    end

    def search
      @product = Product.search(params[:search])
    end

  
  
    def product_params
      params.require(:product).permit(:sku, :title, :price, :quantity, :image, :search,:category)
    end

    
    
  end

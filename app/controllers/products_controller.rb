class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "#{@product.name} has been added to inventory."
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
     @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "#{@product.name} has been updated."
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to '/'
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end

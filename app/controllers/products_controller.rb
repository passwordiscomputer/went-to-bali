class ProductsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html { redirect_to player_path(@product) }
      format.js
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:alert] = "Product added."
      redirect_to '/'
    else
      flash[:alert] = "Product was unable to be created"
      render :new
    end
  end

  def edit
   @product = Product.find(params[:id])
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      flash[:alert] = "Product updated"
      redirect_to edit_product_path(@product)
    else
      flash[:alert] = "Product update not succesful"
      render :edit
    end
  end

  def destroy
    flash[:alert] = "Product destroyed"
    @product= Product.find(params[:id])
    @product.destroy
    redirect_to '/'
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end

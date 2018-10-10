class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])

  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end


  def destroy
    @product = Product.find_by(id: params[:id])
    if @product.delete

      redirect_to products_path
    else
      render @product
    end
  end

  def get_data
    @product = Product.find_by(id: params[:id])
    data = [@product.try(:name),@product.try(:cost_price),@product.try(:gst),@product.try(:total_price),@product.try(:discount)]
    render :json =>  data
  end

  def add_new_product
    @products = Product.all
    @counter = params[:counter]
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost_price, :gst, :total_price, :discount)
  end


end

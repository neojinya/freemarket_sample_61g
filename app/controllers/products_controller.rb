class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @product.images.build
    @condition = Product.conditions.keys
    @delivery_date = Product.delivery_dates.keys
    @delivery_fee_pay = Product.delivery_fee_pays.keys
    @region = Product.regions.keys
    @category_parents = Category.where(ancestry: nil).map{|i| [i.name, i.id]}
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  # -------------- 仮置き -----------------
  def mypage
  end

  def profile
    
  end

  def credit
  end

  private
  def product_params
    params.require(:product).permit( :name, :explanation, :category_id, :condition, :delivery_date, :delivery_fee_pay, :region, :price, images_attributes: {image: []})
  end
end


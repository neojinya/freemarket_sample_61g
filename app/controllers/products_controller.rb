class ProductsController < ApplicationController
  # before_action :move_to_index, except: :index

  def index
    if user_signed_in?
      @products = Product.sale.where.not(seller_id:current_user.id).limit(10)
    else
      @products = Product.sale.limit(10)
    end
    
    # 仮実装
    # @image = Image.new(image: "", product_id: 2)
    # @image.save

  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = find_product_by_id
    @same_seller = @product.seller_id
    @same_seller_product = Product.where(seller_id: @same_seller).limit(6)
    @same_category = @product.category_id
    @related_products = Product.where(category_id: @same_category).limit(6)
    @images = images(@product)
    @name = @product.name
    @price = @product.price
  end


  def edit
    @product = find_product_by_id
  end

  def update
    @product = find_product_by_id
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    product = find_product_by_id
    if product.seller_id == current_user.id
      product.destroy
      redirect_to root_path
    end
  end

  def buy
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
    @product = find_product_by_id
    @images = images(@product)
  end

  # -------------- 仮置き -----------------
  def mypage
  end

  def profile
  end


  def listing
    @products = Product.sale.all
  end

  def showing
    @product = find_product_by_id
    @images = images(@product)
  end

  def users_info
  end

  private
  def product_params
    params.require(:product).permit( :name, :explanation, :category_id, :condition, :delivery_date, :delivery_fee_pay, :region, :price, images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def find_product_by_id
    Product.find(params[:id])
  end

  def images(product)
    images = []
    if product.images.exists?
      product.images.each do |image|
        images << image.image
      end
    else
      images << 'rails-logo.png'
    end
    return images
  end

  # def photos_of_related_products(related_products)
  #   photos = []
  #     related_products.images.each do |p|
  #       photos << p.image
  #     end
  # end
end


class ProductsController < ApplicationController
  # before_action :move_to_index, except: :index

  def index
    @products = Product.all.limit(10)

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
    @product = Product.find(params[:id])
    # @product = Product.where(id: params[:id])
    # @same_seller = @product.buyer_id
    # @same_seller_product = Product.where(seller_id: @seller)
    # @same_bland = @product.bland_id
    # @same_bland_products = Product.where(bland_id: @same_bland)
    @same_category = @product.category_id
    @related_products = Product.where(category_id: @same_category).limit(6)
    @images = images(@product)
    # @related_products_id = @related_products.product_id
    # @image = photos_of_related_products(@related_products)
    @name = @product.name
    @price = @product.price
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  # -------------- 仮置き -----------------
  def mypage
  end

  def profile
  end

  def credit
  end

  def listing
    @products = Product.all.limit(10)
  end

  def showing
    @product = Product.find(params[:id])
    @images = images(@product)
  end

  def users_info
  end

  def buy
    @product = Product.find(params[:id])
    @images = images(@product)
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: amount,
    card: params['payjp-token'],
    currency: 'jpy',
    )
  end

  private
  def product_params
    params.require(:product).permit( :name, :explanation, :category_id, :condition, :delivery_date, :delivery_fee_pay, :region, :price, images_attributes: {image: []})
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


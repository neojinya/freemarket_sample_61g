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
    @condition = Product.conditions.keys
    @delivery_date = Product.delivery_dates.keys
    @delivery_fee_pay = Product.delivery_fee_pays.keys
    @region = Product.regions.keys
    @category_parents = Category.where(ancestry: nil).map{|i| [i.name, i.id]}
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
    @same_seller = @product.seller_id
    @same_seller_product = Product.where(seller_id: @same_seller).limit(6)
    @same_category = @product.category_id
    @related_products = Product.where(category_id: @same_category).limit(6)
    @images = images(@product)
    @name = @product.name
    @price = @product.price
  end

  def buy
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
    @product = Product.find(params[:id])
    @images = images(@product)
  end

  # TODO:card_controllerに移動 20191119 伊藤
  def pay
    card = current_user.cards.first
    if card
      product = Product.find(params[:product][:id])
      Payjp.api_key = ENV["PAY_JP_TEST_SK"]
      charge = Payjp::Charge.create(
        amount: product.price,
        customer: card.customer_id,
        currency: 'jpy'
        )
      if product.update(buyer_id: current_user.id)
        flash[:notice] = '購入しました。'
        redirect_to controller: "products", action: 'show',id: product.id
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: "products", action: 'show',id: product.id
      end
    else
      flash[:alert] = 'クレジットカードを登録してください。'
      render template: 'cards/new'
    end
  end

  # -------------- 仮置き -----------------
  def mypage
  end

  def profile
  end

  def credit
    
  end

  def users_info
  end

  


  private
  def product_params

    params.require(:product).permit( :name, :explanation, :category_id, :condition, :delivery_date, :delivery_fee_pay, :region, :price, images_attributes: {image: []}).merge(seller_id: current_user.id)

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


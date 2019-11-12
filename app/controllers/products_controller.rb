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
    @product = Product.find(params[:id])
    @images = images(@product)
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

  def buy
    @product = Product.find(params[:id])
    @images = images(@product)
  end

  def pay
    @product = Product.find(params[:id])
    Payjp.api_key = 'sk_test_19defe34a00d9dc47b8c355b'
    charge = Payjp::Charge.create(
    amount: @product.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    if @product.update(buyer_id: current_user.id)
      flash[:notice] = '購入しました。'
      redirect_to controller: "products", action: 'show',id: @product.id
    else
      flash[:alert] = '購入に失敗しました。'
      redirect_to controller: "products", action: 'show',id: @product.id
    end
  end


  private
  def product_params
    params.require(:product).permit(
      :name, :explanation, :category_id, :condition, :delivery_date, :delivery_fee_pay,
      :region, :price, images_attributes: {image: []}
      ).merge(seller_id: current_user.id)
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

end


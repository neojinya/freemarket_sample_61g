class ProductsController < ApplicationController
  # before_action :move_to_index, except: :index

  def index
    @products = Product.all.limit(10)

    # 仮実装
    # @image = Image.new(image: "", product_id: 2)
    # @image.save

  end

  def new
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

  private

  def images(product)
    images = []
    if product.images.exists?
      product.images.each do |image|
        images << image
      end
    else
      images << 'rails-logo.png'
    end
    return images
  end


end

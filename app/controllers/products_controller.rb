class ProductsController < ApplicationController
  def index
    @products = Product.all.limit(10)


    # 仮実装
    # @image = Image.new(image: "", product_id: 2)
    # @image.save

  end

  def new
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

  def users_info
  end

  def buy
    binding.pry
    @products = Product.find(params[:id])
  end

end

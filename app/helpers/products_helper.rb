module ProductsHelper
  require 'active_support/core_ext/numeric/conversions'

  # 数値を３桁区切りで返すメソッド
  def generate_three_digits_separator(num)
    return num.to_s(:delimited)
  end

  def condition
    @condition = Product.conditions.keys
  end

  def delivery_date
    @delivery_date = Product.delivery_dates.keys
  end

  def region
    @region = Product.regions.keys
  end

  def delivery_fee_pay
    @delivery_fee_pay = Product.delivery_fee_pays.keys
  end

  def category_parents
    @category_parents = Category.where(ancestry: nil).map{|i| [i.name, i.id]}
  end
end

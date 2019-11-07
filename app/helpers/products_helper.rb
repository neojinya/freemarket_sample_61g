module ProductsHelper
  require 'active_support/core_ext/numeric/conversions'

  # 数値を３桁区切りで返すメソッド
  def generate_three_digits_separator(num)
    return num.to_s(:delimited)
  end
end

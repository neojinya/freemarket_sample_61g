require 'rails_helper'

RSpec.describe Product, type: :model do
  describe Product do
    describe '#create' do
      it "is invalid without a seller_id" do
        product = Product.new(
          name: "ほげほげ",
          price: 8600, 
          size: 25, 
          condition: 3, 
          category_id: 1,
          )
        product.valid?
        expect(product.errors[:seller]).to include("must exist")
      end
    end
    
  end
end
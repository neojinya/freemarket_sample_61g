require "rails_helper"
# テスト 未完成 伊藤
# RSpec.describe Product, type: :model do
#   describe Product do
#     describe '#create' do

#       context "without a seller_id" do
#         it "is invalid " do
#           product = FactoryBot.build(:product, buyer_id: 1)
#           product.valid?
#           expect(product.errors[:seller]).to include("must exist")
#         end
#       end

#       context "without a buyer_id" do
#         it "is valid" do
#           product = FactoryBot.build(:product, category_id: 2,seller_id: 2)
#           product.valid?
#           expect(product).to be_valid
#         end
#       end

#       # let!(:seller_id) {2}
#       # let!(:buyer_id) {1}
#       # it "is valid with a buyer_id" do  
#       #   expect(product).to be_valid
#       # end

#       # let!(:seller_id) {1}
#       # let!(:buyer_id) {1}
#       # it "is invalid buyer_id equals seller_id" do
        
#       # end
#     end
#   end
# end

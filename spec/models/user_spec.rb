require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.create(:user)
  end

  it "is valid with nickname and email and password 
  and birthday and image and profiel_message and num_of_exihibits 
  and phone_number and first_name 
  and last_name and first_name_kata and last_name_kata 
  and post_code and prefecture and city_village_town 
  and house_number and building and " do
    expect(@user).to be_valid
  end

  describe '#create' do
    context "without a email" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:"")
        user_b.valid?
        expect(user_b.errors[:email]).to include("を入力してください")
      end
    end
    context "duplicate email" do
      it "is invalid" do
        user_b  = FactoryBot.build(:user,nickname:"bbb",email:'test@test.com')
        user_b.valid?
        expect(user_b.errors[:email]).to include("はすでに存在します")
      end
    end
    context "without a nickname" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"",email:"bbb@bbb")
        user_b.valid?
        expect(user_b.errors[:nickname]).to include("を入力してください")
      end
    end
    context "duplicate nickname" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"karimei",email:'bbb@bbb')
        user_b.valid?
        expect(user_b.errors[:nickname]).to include("はすでに存在します")
      end
    end

    context "without a password" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',password:"")
        user_b.valid?
        expect(user_b.errors[:password]).to include("を入力してください")
      end
    end

    context "less than 7 letter password" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',password:"testt")
        user_b.valid?
        expect(user_b.errors[:password]).to include("は7文字以上で入力してください")
      end
    end
    
  end
end 
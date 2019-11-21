require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.create(:user)
  end

  describe '#create' do
    it "is valid with nickname and email and password 
  and birthday and image and profiel_message and num_of_exihibits 
  and phone_number and first_name 
  and last_name and first_name_kata and last_name_kata 
  and post_code and prefecture and city_village_town 
  and house_number and building and " do
    expect(@user).to be_valid
  end

    context "without a image" do
      it "is valid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',image:"")
        user_b.valid?
        expect(user_b).to be_valid
      end
    end

    context "without a profiel_message" do
      it "is valid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',profiel_message:"")
        user_b.valid?
        expect(user_b).to be_valid
      end
    end

    context "without a num_of_exihibits" do
      it "is valid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',num_of_exihibits:"")
        user_b.valid?
        expect(user_b).to be_valid
      end
    end

    context "without a building" do
      it "is valid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',building:"")
        user_b.valid?
        expect(user_b).to be_valid
      end
    end

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

    context "without a birthday" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',birthday:"")
        user_b.valid?
        expect(user_b.errors[:birthday]).to include("を入力してください")
      end
    end

    context "without a phone_number" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',phone_number:"")
        user_b.valid?
        expect(user_b.errors[:phone_number]).to include("を入力してください")
      end
    end

    context "include string in phone_number" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',phone_number:"012345678あ0")
        user_b.valid?
        expect(user_b.errors[:phone_number]).to include("は数値で入力してください")
      end
    end

    context "without a first_name" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',first_name:"")
        user_b.valid?
        expect(user_b.errors[:first_name]).to include("を入力してください")
      end
    end

    context "without a last_name" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',last_name:"")
        user_b.valid?
        expect(user_b.errors[:last_name]).to include("を入力してください")
      end
    end

    context "without a first_name_kata" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',first_name_kata:"")
        user_b.valid?
        expect(user_b.errors[:first_name_kata]).to include("を入力してください")
      end
    end

    context "without a last_name" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',last_name_kata:"")
        user_b.valid?
        expect(user_b.errors[:last_name_kata]).to include("を入力してください")
      end
    end

    context "without a post_code" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',post_code:"")
        user_b.valid?
        expect(user_b.errors[:post_code]).to include("を入力してください")
      end
    end

    context "include string in post_code" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',post_code:"012あ023")
        user_b.valid?
        expect(user_b.errors[:post_code]).to include("は数値で入力してください")
      end
    end

    context "without a prefecture" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',prefecture:"")
        user_b.valid?
        expect(user_b.errors[:prefecture]).to include("を入力してください")
      end
    end

    context "without a city_village_town" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',city_village_town:"")
        user_b.valid?
        expect(user_b.errors[:city_village_town]).to include("を入力してください")
      end
    end

    context "without a house_number" do
      it "is invalid" do
        user_b = FactoryBot.build(:user,nickname:"bbb",email:'bbb@bbb',house_number:"")
        user_b.valid?
        expect(user_b.errors[:house_number]).to include("を入力してください")
      end
    end
  end
end 
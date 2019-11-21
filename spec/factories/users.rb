FactoryBot.define do
  factory :user do
    email {'test@test.com'}
    password {'testtest'}
    first_name {'仮名'}
    last_name {'太郎'}
    first_name_kata {'カリメイ'}
    last_name_kata {'タロウ'}
    nickname {'karimei'}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.png'))}
    profiel_message {'こんにちは。よろしくお願いします。'}
    num_of_exihibits {1}
    phone_number {'0966611111'}
    post_code {'1111111'}
    prefecture {'東京都'}
    city_village_town {'渋谷区'}
    house_number {'3丁目'}
    building {'1番地'}
    birthday {'1986-11-02'}
  end
end

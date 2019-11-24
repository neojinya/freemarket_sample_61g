crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
  parent :root
end

crumb :profile do
  link "プロフィール", mypage_profile_path
  parent :mypage
end

crumb :users_info do
  link "本人情報の登録", mypage_users_info_path
  parent :mypage
end

crumb :credit do
  link "支払い方法", new_card_path
  parent :mypage
end

crumb :listing do
  link "出品した商品 - 出品中", mypage_listing_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_path
  parent :mypage
end

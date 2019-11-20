$(document).on("turbolinks:load", function(){

  function decode_src(ele) {
    var ds = decodeURI($(ele).attr("src"));
    var src = ds.replace(/\[\"/g, '').replace(/\"\]/g, '');
    $(ele).attr('src', src);
  }

  // トップページの画像srcをデコード
  $(".item-box-img").each(function(i, ele){
    decode_src(ele);
  });

  // 商品詳細ページの画像srcをデコード
  $(".item-image").each(function(i, ele) {
    decode_src(ele);
  });

  var current_path = location.pathname;

  var paths = {
    mypage: "/mypage",
    profile: "/mypage/profile",
    logout: "/logout",

  };

  Object.keys(paths).forEach(function(value){
    if (current_path == this[value]) {
      $(`#${value}`).addClass("active");
    }
    else {
      $(`#${value}`).removeClass("active");
    }
  }, paths);

  

});
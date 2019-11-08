$(document).on("turbolinks:load", function(){

  function decode_src(ele) {
    var ds = decodeURI($(ele).attr("src"));
    var src = ds.replace(/\[\"/g, '').replace(/\"\]/g, '');
    $(ele).attr('src', src);
  }


  $(".item-box-img").each(function(i, ele){
    decode_src(ele);
  });

  $(".item-image").each(function(i, ele) {
    decode_src(ele);
  });
});
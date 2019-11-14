$(function(){
  $('.product-show__image-content img').mouseenter(function(){
    var thisImg = $(this).attr('src');
    var thisAlt = $(this).attr('alt');
    $('.photo_field img').attr({src: thisImg,alt: thisAlt});
  });
});
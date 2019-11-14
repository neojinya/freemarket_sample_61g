$(document).on('turbolinks:load', function() {
$('.header__contents__low__left__categories').hover(
  function() {
    $('.header__contents__low__left__categories > a').css('color', '#0095ee');
    $('.header__contents__low__left__categories > ul').css('display', 'block');
  },
  function() {
    $('.header__contents__low__left__categories > a').css('color', 'black');
    $('.header__contents__low__left__categories > ul').css('display', 'none');
  }
)

  $('.header__contents__low__left__brands').hover(
    function() {
      $('.header__contents__low__left__brands > a').css('color', '#0095ee');
      $('.header__contents__low__left__brands > ul').css('display', 'block');
    },
    function() {
      $('.header__contents__low__left__brands > a').css('color', 'black');
      $('.header__contents__low__left__brands > ul').css('display', 'none');
    }
  );
});
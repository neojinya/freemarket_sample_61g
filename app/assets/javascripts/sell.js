$(document).on("turbolinks:load", function(){
  function update_field(){
    var fee = Math.floor($('#product_price').val() / 10);
    var putFee = String(fee).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,' );
    var profit = $('#product_price').val() - fee;
    var putProfit = String(profit).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,' );
    if($('#product_price').val() >= 300 && $('#product_price').val() <= 9999999){
      $('#fee-right').text('¥' + putFee);
      $('#profit-right').text('¥' + putProfit);
    }else{
      $('#fee-right').text('-');
      $('#profit-right').text('-');
    }
  }

  $('#product_price').on('keyup change', function() {
      update_field();
    });
  });
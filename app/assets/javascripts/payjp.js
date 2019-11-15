document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null) {
      Payjp.setPublicKey('pk_test_0d064a457c5e9af6490bba08');
      let btn = document.getElementById("token_submit");
      btn.addEventListener("click", e => {
        e.preventDefault();
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        };
        Payjp.createToken(card, (status, response) => {
          if (response.error) {
            alert("カード情報が正しくありません。");
          } else {
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");
            $('<input type="hidden" name="payjp-token">').val(response.id)
            $('#charge-form').submit();
            alert("登録が完了しました");
          }
        });
      });
    }
  },
  false
);
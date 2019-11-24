$(document).on("turbolinks:load", function(){

$(".upload-0").on("change", function(){
  var fileprop = $(this).prop("files")[0];
  
  var filereader = new FileReader();
  var upload_list = $(".upload-items ul");
  
  var html = `<li class="upload-item-list">
                <figure class="upload-figure">
                  <img id="img-prev-0">
                </figure>
                <div class="upload-button">
                  <a href>削除</a>
                </div>
              </li>`

  // var label_html = 
  // `<label class="upload-box__drop-box" for="up-1">
  //   <input class="upload-1" id="up-1" multiple="multiple" type="file" name="product[images_attributes][1][image][]" />
  //   <pre>
  //   ドラッグアンドドロップ
  //   またはクリックしてファイルを アップロード
  //   </pre>
  // </label>`

  upload_list.append(html);

  filereader.onload = function(e) {
      $(`#img-prev-0`).attr("src", e.target.result);
      // $(".upload-box__drop-box-0").css("display", "none");
      
      $(".upload-box__drop-box").css("display", "none");

      // $(".upload-box").append(label_html);
  }

    
  filereader.readAsDataURL(fileprop);
});




// $(document).on("change", ".upload-1", function(){
//   var fileprop = $(this).prop("files")[0];
//   var img = $("#img-prev");
//   var filereader = new FileReader();
//   var upload_list = $(".upload-items ul");
  
//   var html = `<li class="upload-item-list">
//                 <figure class="upload-figure">
//                   <img id="img-prev-1">
//                 </figure>
//                 <div class="upload-button">
                  
//                   <a href="#">削除</a>
//                 </div>
//               </li>`

//   var label_html = 
//   `<label class="upload-box__drop-box" for="up-2">
//     <input class="upload-2" id="up-2" multiple="multiple" type="file" name="product[images_attributes][2][image][]" />
//     <pre>
//     ドラッグアンドドロップ
//     またはクリックしてファイルを アップロード
//     </pre>
//   </label>`

//   upload_list.append(html);

//   filereader.onload = function(e) {
//       $(`#img-prev-1`).attr("src", e.target.result);
      
//       $(".upload-box__drop-box").css("display", "none");

//       $(".upload-box").append(label_html);

//   }

//   $("#img-prev-1").parent().parent().find(".upload-button").on("click", function(){
    
//   })
    
//     filereader.readAsDataURL(fileprop);
// });

// // $(document).on("click", $("#img-prev-1").parent().parent().find(".upload-button"), function(){
// //   // e.preventDefault();
// //   $("#img-prev-1").parent().parent().find(".upload-button").parent().remove();
// // })



// $(document).on("change", ".upload-2", function(){
//   var fileprop = $(this).prop("files")[0];
//   var img = $("#img-prev");
//   var filereader = new FileReader();
//   var upload_list = $(".upload-items ul");
  
//   var html = `<li class="upload-item-list">
//                 <figure class="upload-figure">
//                   <img id="img-prev-2">
//                 </figure>
//                 <div class="upload-button">
                 
//                   <a href="#">削除</a>
//                 </div>
//               </li>`
  
//   var label_html = 
//   `<label class="upload-box__drop-box" for="up-3">
//     <input class="upload-3" id="up-3" multiple="multiple" type="file" name="product[images_attributes][3][image][]" />
//     <pre>
//     ドラッグアンドドロップ
//     またはクリックしてファイルを アップロード
//     </pre>
//   </label>`

//   upload_list.append(html);

//   filereader.onload = function(e) {
//       $(`#img-prev-2`).attr("src", e.target.result);
      
//       $(".upload-box__drop-box").css("display", "none");

//       $(".upload-box").append(label_html);

//   }
    
    
//     filereader.readAsDataURL(fileprop);
// });

// $(document).on("change", ".upload-3", function(){
//   var fileprop = $(this).prop("files")[0];
//   var img = $("#img-prev");
//   var filereader = new FileReader();
//   var upload_list = $(".upload-items ul");
  
//   var html = `<li class="upload-item-list">
//                 <figure class="upload-figure">
//                   <img id="img-prev-3">
//                 </figure>
//                 <div class="upload-button">
                 
//                   <a href="#">削除</a>
//                 </div>
//               </li>`

//   var label_html = 
//   `<label class="upload-box__drop-box" for="up-4">
//     <input class="upload-4" id="up-4" multiple="multiple" type="file" name="product[images_attributes][4][image][]" />
//     <pre>
//     ドラッグアンドドロップ
//     またはクリックしてファイルを アップロード
//     </pre>
//   </label>`

//   upload_list.append(html);

//   filereader.onload = function(e) {
//       $(`#img-prev-3`).attr("src", e.target.result);
      
//       $(".upload-box__drop-box").css("display", "none");

//       $(".upload-box").append(label_html);

//   }
    
    
//     filereader.readAsDataURL(fileprop);
// });



// $(document).on("change", ".upload-4", function(){
//   var fileprop = $(this).prop("files")[0];
//   var img = $("#img-prev");
//   var filereader = new FileReader();
//   var upload_list = $(".upload-items ul");
  
//   var html = `<li class="upload-item-list">
//                 <figure class="upload-figure">
//                   <img id="img-prev-4">
//                 </figure>
//                 <div class="upload-button">
                  
//                   <a href="#">削除</a>
//                 </div>
//               </li>`

//   upload_list.append(html);

//   filereader.onload = function(e) {
//       $(`#img-prev-4`).attr("src", e.target.result);

//       $(".upload-box__drop-box").css("display", "none");
      
//     var upload_box_html = 
//   `<div class="upload-box bottom">
//     <div class="upload-box__items-container">
//       <div class="upload-items">
//         <ul>
//         </ul>
//       </div>
//     </div>
//     <label class="upload-box__drop-box" for="up-5">
//       <input class="upload-5" id="up-5" multiple="multiple" type="file" name="product[images_attributes][5][image][]" />
//       <pre>
//       ドラッグアンドドロップ
//       またはクリックしてファイルを アップロード
//       </pre>
//     </label>
//   </div>`
//       $(".upload-box").after(upload_box_html);
      
//   }
    
//   filereader.readAsDataURL(fileprop);
// });

// $(document).on("change", ".upload-5", function(){
//   var fileprop = $(this).prop("files")[0];
//   var img = $("#img-prev");
//   var filereader = new FileReader();
//   var upload_list = $(".bottom .upload-items ul");
  
//   var html = `<li class="upload-item-list">
//                 <figure class="upload-figure">
//                   <img id="img-prev-5">
//                 </figure>
//                 <div class="upload-button">
                  
//                   <a href="#">削除</a>
//                 </div>
//               </li>`

//   var label_html = 
//   `<label class="upload-box__drop-box" for="up-6">
//     <input class="upload-6" id="up-6" multiple="multiple" type="file" name="product[images_attributes][6][image][]" />
//     <pre>
//     ドラッグアンドドロップ
//     またはクリックしてファイルを アップロード
//     </pre>
//   </label>`

//   upload_list.append(html);

//   filereader.onload = function(e) {
//       $(`#img-prev-5`).attr("src", e.target.result);
      
//       $(".bottom .upload-box__drop-box").css("display", "none");

//       $(".bottom").append(label_html);

//   }
    
    
//     filereader.readAsDataURL(fileprop);
// });
// $(document).on("change", ".upload-6", function(){
//   var fileprop = $(this).prop("files")[0];
//   var img = $("#img-prev");
//   var filereader = new FileReader();
//   var upload_list = $(".bottom .upload-items ul");
  
//   var html = `<li class="upload-item-list">
//                 <figure class="upload-figure">
//                   <img id="img-prev-6">
//                 </figure>
//                 <div class="upload-button">
                  
//                   <a href="#">削除</a>
//                 </div>
//               </li>`

//   var label_html = 
//   `<label class="upload-box__drop-box" for="up-7">
//     <input class="upload-7" id="up-7" multiple="multiple" type="file" name="product[images_attributes][7][image][]" />
//     <pre>
//     ドラッグアンドドロップ
//     またはクリックしてファイルを アップロード
//     </pre>
//   </label>`

//   upload_list.append(html);

//   filereader.onload = function(e) {
//       $(`#img-prev-6`).attr("src", e.target.result);
      
//       $(".bottom .upload-box__drop-box").css("display", "none");

//       $(".bottom").append(label_html);

//   }
    
    
//     filereader.readAsDataURL(fileprop);
// });

// $(document).on("change", ".upload-7", function(){
//   var fileprop = $(this).prop("files")[0];
//   var img = $("#img-prev");
//   var filereader = new FileReader();
//   var upload_list = $(".bottom .upload-items ul");
  
//   var html = `<li class="upload-item-list">
//                 <figure class="upload-figure">
//                   <img id="img-prev-7">
//                 </figure>
//                 <div class="upload-button">
                  
//                   <a href="#">削除</a>
//                 </div>
//               </li>`

//   var label_html = 
//   `<label class="upload-box__drop-box" for="up-8">
//     <input class="upload-8" id="up-8" multiple="multiple" type="file" name="product[images_attributes][8][image][]" />
//     <pre>
//     ドラッグアンドドロップ
//     またはクリックしてファイルを アップロード
//     </pre>
//   </label>`

//   upload_list.append(html);

//   filereader.onload = function(e) {
//       $(`#img-prev-7`).attr("src", e.target.result);
      
//       $(".bottom .upload-box__drop-box").css("display", "none");

//       $(".bottom").append(label_html);

//   }
    
    
//     filereader.readAsDataURL(fileprop);
// });


// $(document).on("change", ".upload-8", function(){
//   var fileprop = $(this).prop("files")[0];
//   var img = $("#img-prev");
//   var filereader = new FileReader();
//   var upload_list = $(".bottom .upload-items ul");
  
//   var html = `<li class="upload-item-list">
//                 <figure class="upload-figure">
//                   <img id="img-prev-8">
//                 </figure>
//                 <div class="upload-button">
                  
//                   <a href="#">削除</a>
//                 </div>
//               </li>`

//   var label_html = 
//   `<label class="upload-box__drop-box" for="up-9">
//     <input class="upload-9" id="up-9" multiple="multiple" type="file" name="product[images_attributes][9][image][]" />
//     <pre>
//     ドラッグアンドドロップ
//     またはクリックしてファイルを アップロード
//     </pre>
//   </label>`

//   upload_list.append(html);

//   filereader.onload = function(e) {
//       $(`#img-prev-8`).attr("src", e.target.result);
      
//       $(".bottom .upload-box__drop-box").css("display", "none");

//       $(".bottom").append(label_html);

//   }
    
    
//     filereader.readAsDataURL(fileprop);
// });

// $(document).on("change", ".upload-9", function(){
//   var fileprop = $(this).prop("files")[0];
//   var img = $("#img-prev");
//   var filereader = new FileReader();
//   var upload_list = $(".bottom .upload-items ul");
  
//   var html = `<li class="upload-item-list">
//                 <figure class="upload-figure">
//                   <img id="img-prev-9">
//                 </figure>
//                 <div class="upload-button">
                  
//                   <a href="#">削除</a>
//                 </div>
//               </li>`

//   upload_list.append(html);

//   filereader.onload = function(e) {
//       $(`#img-prev-9`).attr("src", e.target.result);
      
//       $(".bottom .upload-box__drop-box").css("display", "none");

//   }
    
//     filereader.readAsDataURL(fileprop);

// });

});
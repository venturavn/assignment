// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(function () {
  $('.quick_product, .quick_product2').click(function () {
    a = $(this).find("a");
    location.href = a.attr("href");
  })
  $('.cart .cartBtn').click(function () {
    btn = $(this);
    textbox = $(this).parent().children('.cartNum');
    quantity = parseInt(textbox.val());
    product_id = $(this).attr("product-id");
    if(!quantity || quantity<=0) {
      alert("Please input the right number (greater than 0) of the product beside the Cart button.")
      return;
    }
    $.get('/cart/add/' + product_id + "/" + quantity, function (data) {
      if(!(data && data.errorCode != null && data.errorCode != 3)) {
        alert("Something went wrong!");
        return false;
      }
      switch (data.errorCode) {
        case 1: alert("You haven't login in yet!"); break;
        case 2: alert("Product not found!"); break;
        case 0: switch (data.successCode) {
          case 1: alert("You have added " + quantity + " item(s) of the product to your Cart."); break;
          case 2: alert("You have added " + quantity + " item(s) more of the product to your Cart."); break;
          default: alert("Something went wrong!"); return; break;
        }; break;
        default: alert("Something went wrong!"); return; break;
      }
      btn.addClass("btn-success");
      btn.children('.icon-shopping-cart').addClass("icon-white");
    })
  });


$('.cart_edit .cartBtn').click(function () {
    btn = $(this);
    textbox = $(this).parent().children('.cartNum');
    quantity = parseInt(textbox.val());
    product_id = $(this).attr("product-id");
    if(!quantity || quantity<=0) {
      alert("Please input the right number (greater than 0) of the product beside the Cart button.")
      return;
    }
    $.get('/cart/edit/' + product_id + "/" + quantity, function (data) {
      if(!(data && data.errorCode != null && data.errorCode != 3)) {
        alert("Something went wrong!");
        return false;
      }
      switch (data.errorCode) {
        case 1: alert("You haven't login in yet!"); break;
        case 2: alert("Product not found!"); break;
        case 0: switch (data.successCode) {
          case 1: alert("You have edit the product's quantity to " + quantity + "."); break;
          default: alert("Something went wrong!"); return; break;
        }; break;
        default: alert("Something went wrong!"); return; break;
      }
      btn.addClass("btn-success");
      btn.children('.icon-shopping-cart').addClass("icon-white");
      location.reload();
    })
  });

  $('.cartDeleteBtn').click(function() {
    if (!confirm("Are you sure want to remove the product?"))
    product_id = $(this).attr("product-id");
    $.get('/cart/delete/' + product_id + "/", function () {
      location.reload();
    });
  });
});

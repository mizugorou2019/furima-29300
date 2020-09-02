function price()
// const Tax = 1.1;

// key
var price = document.getElementById("item-price");
// console.log("priceBeforeTax");
price.addEventListener("keyup", event => {
  // console.log(event.key);
  const XHR = new XMLHttpRequest();
  XHR.open("PUT", "/items/new");
  XHR.send(formData);

  XHR.onload =() => {
    if(XHR.status !=200){
      return null;
    }
  }
});

var fee = price / 10;
// 四捨五入のコード追加
var fee = Math.round(price);

var profit = document.getElementsById("profit");
profit = price - fee;

window.addEventListener("load", price);


// jsonは不要

// 9月2日(水)発見
$(function(){
  $("#item_price").on('keyup', function(){
    var price = $("#item_price").val();
    if( 300 <= price && price <= 9999999) {
    var fee = Math.floor(price / 10);
    var profit = (price - fee);
    $(".fee-span").text(fee);
    $(".profit-span").text(profit);
    }else{
    $(".fee-span").text('');
    $(".profit-span").text('');
    }
  })
})
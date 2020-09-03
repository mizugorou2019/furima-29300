window.addEventListener('load', function(){
  
  let price = document.getElementById("item-price")
  let tax = document.getElementById("add-tax-price")
  let profit = document.getElementById("profit")

  price.addEventListener('keyup', function(){
    const fee = price.value;
    if( 300 <= fee && fee <= 9999999) {
      const tax_price = Math.floor(fee / 10);
      const profit_price = (fee - tax_price);
      tax.innerHTML = tax_price;
      profit.innerHTML = profit_price;
    }else{
      tax.innerHTML = "";
      profit.innerHTML = "";
    }
  })
})
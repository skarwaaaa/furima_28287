function sales() {
  const price = document.getElementById("item-price");
  const taxprice = document.getElementById("add-tax-price");
  const salseprofit = document.getElementById("profit");

  price.addEventListener("keyup", function() { 
    const itemPrice = this.value;
    const tax = itemPrice*0.1;
    const gain =itemPrice-tax;
    taxprice.innerHTML = tax
    salseprofit.innerHTML = gain
    });
  };

 window.addEventListener("load", sales);



function calculation (){
  const number = document.getElementById("item-price");
  number.addEventListener("keyup", () => {
    let itemPrice = number.value
    let itemFee = Math.floor( itemPrice * 0.1 )
    let itemProfit = itemPrice - itemFee
    const feeDisplay = document.getElementById("add-tax-price")
    const profitDisplay = document.getElementById("profit")
    feeDisplay.innerHTML = itemFee
    profitDisplay.innerHTML = itemProfit
  });
};

window.addEventListener('load', calculation);
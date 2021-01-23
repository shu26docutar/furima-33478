function calculation (){
    const itemPrice = document.getElementById("item-price");
    
    itemPrice.addEventListener("input", () => {
        const itemValue = itemPrice.value;

        const addTaxPrice = document.getElementById("add-tax-price");
        addTaxPrice.innerHTML = Math.floor(itemValue * 0.1);

        const Profit = document.getElementById("profit");
        Profit.innerHTML = Math.floor( itemValue - ( itemValue * 0.1 ) );
    });
}
window.addEventListener('load', calculation);
function food() {
  const submit = document.getElementById("food_submit");
  const newFood = document.getElementById("new_food");

    submit.addEventListener("click", (e) => {
      
      const refrigeId = newFood.getAttribute("data-id")
    const formData = new FormData(document.getElementById("form"));// メモ投稿のフォームに入力された情報をidで取得
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/refriges/${refrigeId}/foods `, true);
    XHR.responseType = "json";
    XHR.send(formData);


    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.food;
      const list = document.getElementById("list");
      const nameText = document.getElementById("food_name");
      const productText = document.getElementById("product_name")
      const categoryText = document.getElementById("category_id")
      const purchaseText = document.getElementById("purchase_date")
      const sellText = document.getElementById("sell_by")
      const shopText = document.getElementById("shop")
      // もしitemが存在しない場合→
       if (item.id == null) {
        alert(`食材名・カテゴリー・購入日 の記入をしてください`);
        return null;
      } else{
      // ↓もしitemが存在する場合
      const HTML = `

      <table class="food_table">
          <tr class="item">
             <td class="food_name">
               ${item.food_name}
             </td>
             <td class="product_name">
               ${item.product_name}
             </td>
             <td class="category_id">
               ${item.category.name}
             </td>
             <td class="purchase_date">
               ${item.purchase_date}
             </td>
             <td class="sell_by">
               ${item.sell_by}
             </td>
             <td class="shop">
               ${item.shop}
            </td>
           </tr>
      </table>`;
      

      list.insertAdjacentHTML("afterend", HTML);
      nameText.value = "";
      productText.value = "";
      shopText.value = "";
      purchaseText.value = null;
      sellText.value = null;
      categoryText.value = "1";
     
    };
    e.preventDefault();
   }
  });

}
window.addEventListener("load", food);
// setInterval(food, 1000);
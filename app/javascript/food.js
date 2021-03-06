function food() {
  const submit = document.getElementById("food_submit");
  const newFood = document.getElementById("new_food");
  const newCategory = document.getElementById("new_food");

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
      const category = XHR.response.category;
      console.log(category);
      const list = document.getElementById("list");
      const nameText = document.getElementById("food_name");
      const productText = document.getElementById("product_name")
      const categoryText = document.getElementById("category_id")
      const purchaseText = document.getElementById("purchase_date")
      const sellText = document.getElementById("sell_by")
      const shopText = document.getElementById("shop")
        // もしitemが存在しない場合→
        if (item.id == null) {
          alert(`食材名・カテゴリー・購入日・賞味期限 の記入をしてください`);
          return null;
          }else{
          // ↓もしitemが存在する場合
          const HTML = `

           <div class="food_table">
             <div class="item_js">
               <div class="food_name_js">
               <a> ${item.food_name}</a>
               </div>
               <div class="product_name_js">
               <a>${item.product_name}</a>
               </div>
               <div class="category_id_js">
               <a>${category.attributes.name}</a>
               </div>
               <div class="purchase_date_js">
               <a>${item.purchase_date}</a>
               </div>
               <div class="sell_by_js">
               <a>${item.sell_by}</a>
               </div>
               <div class="shop_js">
               <a>${item.shop}</a>
               </div>
             </div>
           </div>`;
           list.insertAdjacentHTML("afterend", HTML);
           nameText.value = "";
           productText.value = "";
           shopText.value = "";
           purchaseText.value = null;
           sellText.value = null;
           categoryText.value = "1";
        };
    }
   e.preventDefault();
   // 標準設定されている（Default）イベントを阻止する（prevent）メソッド二重で処理が重ならないよう。リロードした時にcreateアクションのみしてもらうようにする。
  });
}
window.addEventListener("load", food);
// setInterval(food, 1000);
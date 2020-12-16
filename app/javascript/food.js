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
      const formText = document.getElementById("food_name", "product_name","category_id","purchase_date","sell_by","shop");
      const HTML = `
      
      <tbody class="bulk-registration-field">
          <tr class="item">
             <td class="form-control">
           ${item.food_name}
         </td>
         <td class="form-control">
          ${item.product_name}
         </td>
         <td class="form-control">
          ${item.category_id}
         </td>
         <td class="form-control">
          ${item.purchase_date}
         </td>
         <td class="form-control">
        ${item.sell_by}
         </td>
         <td class="form-control">
         ${item.shop}
         </td>
          </tr>
        
      </tbody>`;

      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });

}
window.addEventListener("load", food);
// setInterval(food, 1000);
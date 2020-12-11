function check() {
  const foods = document.querySelectorAll(".food");
         // querySelectorAllメソッドで、foodをクラス名にもつ要素を取得できる
         // views/foods/index.html.erbのfood部分のブロックをクリックした時にイベントを発火させたい
    foods.forEach(function (food) {
      food.addEventListener("click", () => { // 要素1つずつに対して、「クリック」した際に動作する処理を記述
         // ↓ここにクリックした時に行う「何らかの処理」を記述していく

        const foodId = food.getAttribute("data-id");
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/foods/${foodId}`, true); // open どんなリクエストをするのかを指定するメソッド// HTTPメソッドの指定,パスの指定,非同期通信のON/OFF
        XHR.responseType = "json";
        XHR.send();
        // ↑ここまでクリックした時に行う「何らかの処理」を記述していく


        // ↓ここからレスポンシブがあがあった場合の処理
        XHR.onload = () => {
        // レスポンスがエラーだった場合の処理
          if (XHR.status != 200) {
            alert(`Error ${XHR.status}: ${XHR.statusText}`);
            return null; // return null;によってJavaScriptの処理から抜け出すことができます。
            }
          // onloadはレスポンスなどの受信が成功した場合の処理
          const item = XHR.response.food;// checkedアクションで返却したitemは、XHR.response.foodで取得できる
          if (item.checked === true) {
            food.setAttribute("data-check", "true"); // data-checkの属性値にtrueをセット
          } else if (item.checked === false) {
           food.removeAttribute("data-check");// data-checkは属性ごと削除
          }
      };
            // ↑ここまでレスポンシブがあがあった場合の処理
    });
  });
}
window.addEventListener("load", check);
const pay = ()=>{
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) =>{
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("shopping_address[number]"),
      cvc: formData.get("shopping_address[cvc]"),
      exp_month: formData.get("shopping_address[exp_month]"),
      exp_year: `20${formData.get("shopping_address[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id; //トークン情報をresponseから取得
        const renderDom = document.getElementById("charge-form"); //送信フォームオブジェクトを準備
        const tokenObj = `<input value=${token} type="hidden" name='token'>`; //トークンをhiddenで付与したタグを準備
        renderDom.insertAdjacentHTML("beforeend", tokenObj); //トークンタグをフォームオブジェクトに結合
      } else {
      }
        document.getElementById("card-number").removeAttribute("name"); //以下で入力された各カード情報がパラメーターとして送られないように、値を削除しています。 
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();//トークンが付与されたフォームオブジェクトを送信
        document.getElementById("charge-form").reset();

    });
  });
};

window.addEventListener("load", pay);
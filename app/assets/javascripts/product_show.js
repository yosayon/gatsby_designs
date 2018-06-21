
Product.attachBackNextHandlers = () => {
 $("#back").click(Product.goBack)
 $("#next").click(Product.goNext)
}

Product.goBack = function(){
 let id = parseInt($("#back").attr("data-id"));
 id === 1 ? id = 1 : id--
 $.get("/products/" + id + ".json", function(data){
  let newProduct = new Product(data.product)
  let product = newProduct.renderProductShowTemplate();
  $("#products-show").html(product)
  history.replaceState(null, null, id);
  Product.attachBackNextHandlers();
 })
}

Product.goNext = function(){
 console.log("I'm going next");
 let id = parseInt($("#next").attr("data-id"));
 id === 15 ? id = 15 : id++;
  $.get("/products/" + id + ".json", function(data){
  let newProduct = new Product(data.product)
  let product = newProduct.renderProductShowTemplate();
  $("#products-show").html(product)
  history.replaceState(null, null, id);
  Product.attachBackNextHandlers();
 })
}

$("#backnext").ready(() => {
 Product.attachBackNextHandlers();
})

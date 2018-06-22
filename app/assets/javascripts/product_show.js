Product.attachBackNextHandlers = () => {
 $("#back").click(Product.goBack)
 $("#next").click(Product.goNext)
}

Product.goBack = function(){
 console.log("went back for no reason!")
 Review.getReviewForm();
 let id = parseInt($("#back").attr("data-id"));
 id === 1 ? id = 1 : id--
 $.get("/products/" + id + ".json", function(data){
  let newProduct = new Product(data.product)
  let product = newProduct.renderProductShowTemplate();
  $(".products.show").html(product)
  $("#product-review-container").html('')
  newProduct.reviews.forEach(review => {
    let newReview = new Review(review)
    let reviewContent = newReview.renderProductReviewTemplate()
    $("#product-review-container").append(reviewContent)
  })
  history.replaceState(null, null, id);
  Product.attachBackNextHandlers();
  Review.getReviewForm();
  Product.addToCart()
 })
}

Product.goNext = function(){
 let id = parseInt($("#next").attr("data-id"));
 id === 15 ? id = 15 : id++;
 $.get("/products/" + id + ".json", function(data){
  let newProduct = new Product(data.product)
  let product = newProduct.renderProductShowTemplate();
  $(".products.show").html(product)
  $("#product-review-container").html('')
  newProduct.reviews.forEach(review => {
    let newReview = new Review(review)
    let reviewContent = newReview.renderProductReviewTemplate()
    $("#product-review-container").append(reviewContent)
  })
  history.replaceState(null, null, id);
  Review.getReviewForm();
  Product.attachBackNextHandlers();
  Product.addToCart();
 })
}

$("#backnext").ready(() => {
 Product.attachBackNextHandlers();
})

let getOrders = function(orders){
 let id = $(".current_user")[0].id
 var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
  $.get(`/users/${id}/orders`, function(orders){
   orders.data.map(function(order){
    //console.log(order.attributes["created-at"]);
   var order_date  = new Date(order.attributes["created-at"]);
    $('#user-orders').append(`<li><a href="/users/${id}/orders/${order.id}">
    Order Number: ${order.id} ${order_date.toLocaleDateString("en-US")}</a>
    </li>`);
   })
 })
}

let getReviews = function(reviews){
 let id = $(".current_user")[0].id
 $.get(`/users/${id}/reviews`, function(reviews){
  console.log(reviews);
   reviews.data.forEach(function(review){
    let newReview = new Review(review)
    console.log(newReview);
    let reviewHTML = `
    <li><a href="/users/${id}/reviews/${newReview.id}">${newReview.title}</a></li>
    `
    $("#user-reviews").append(reviewHTML)
   })
 })
}

let attachListeners = function(){
 $("#button-orders").click(function(){
  //console.log("I just hijacked this button!");
  if ($("#user-orders").text() === ""){
   getOrders(this)
  }
 })
 $("#button-reviews").click(function(){
  if ($("#user-orders").text() === ""){
   getReviews(this)
  }
 })
}

function Review(review){
 this.id = review.id,
 this.title = review.attributes.title,
 this.comment = review.attributes.comment,
 this.user_id = review.attributes.user_id,
 this.product_id = review.attributes.product_id
}

$(".users.show").ready(attachListeners);

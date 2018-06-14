const bindOrderHandlers = () => {
 let id = $(".current_user")[0].id;
 $("#button-orders").click((e) => {
  $.get(`/users/${id}/orders.json`, (response) => {
   $('#user-orders').html('');
   response.data.forEach(order => {
    let newOrder = new Order(order)
    let orderHTML = newOrder.formatIndex();
    $('#user-orders').append(orderHTML);
   })
  })
 })
}

function Order(order){
 this.id = order.id,
 this.user_id = order.attributes["user-id"],
 this.created_at = order.attributes["created-at"]
}

Order.prototype.formatTime = function(){
 const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
 let order_date  = new Date(this.created_at);
 return order_date.toLocaleDateString("en-US");
}

Order.prototype.formatIndex = function(){
 let orderHTML = `
  <li>
   <a href="/users/${this.user_id}/orders/${this.id}"> Order Number: ${this.id} ${this.formatTime()}</a>
  </li>
 `
 return orderHTML;
}

$(".users.show").ready(bindOrderHandlers)

// function Review(review){
//  this.id = review.id,
//  this.title = review.attributes.title,
//  this.comment = review.attributes.comment,
//  this.user_id = review.attributes.user_id,
//  this.product_id = review.attributes.product_id
// }

// let getReviews = function(reviews){
//  let id = $(".current_user")[0].id
//  $.get(`/users/${id}/reviews`, function(reviews){
//   console.log(reviews);
//    reviews.data.forEach(function(review){
//     let newReview = new Review(review)
//     //console.log(newReview);
//     let reviewHTML = `
//     <li><a href="/users/${id}/reviews/${newReview.id}">${newReview.title}</a></li>
//     `
//     $("#user-reviews").append(reviewHTML)
//    })
//  })
// }
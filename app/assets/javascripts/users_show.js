function handlebarsSetup(){
  Handlebars.registerPartial('lineItemPartial', $("#line-item-partial")[0].innerHTML);
 }
 
 
 function attachListeners(){
 handlebarsSetup();
 bindOrderHandlers();
 bindReviewHandlers();
}

const bindOrderHandlers = () => {
 let id = $(".current_user")[0].id;
 $("#button-orders").click((e) => {
  $.get(`/users/${id}/orders.json`, (response) => {
   $('#user-orders').html('');
   response.orders.forEach(order => {
    let newOrder = new Order(order)
    let orderHTML = newOrder.formatIndex();
    $('#user-orders').append(orderHTML);
   })
   bindOrderShowHandlers();
  })
 })
}

const bindOrderShowHandlers = () => {
 $('#user-orders li a').hover(function(e){
 e.preventDefault();
 $.get(`${this.href}.json`, (response) => {
  let newOrder = new Order(response.order);
  let template = newOrder.orderShowTemplate();
  let results = newOrder.insertIntoPartial();
  $("#user-orders-show")[0].innerHTML = template(results);
  })
 })
}

const bindReviewHandlers = () =>{
 let id = $(".current_user")[0].id
 $("#button-reviews").click((e) => {
 $.get(`/users/${id}/reviews.json`, (response) => {
  $('#user-reviews').html('');
  console.log(response.reviews)
  response.reviews.forEach(review => {
   let newReview = new Review(review);
   let reviewHTML = newReview.formatIndex();
     $("#user-reviews").append(reviewHTML);
   })
   bindReviewShowHandlers();
  })
 })
}

const bindReviewShowHandlers = () =>{
 $('#user-reviews li a').hover(function(e){
 e.preventDefault();
 $.get(`${this.href}.json`, (response) => {
  let newReview = new Review(response.review)
  let template = newReview.reviewShowTemplate();
  let results = newReview.insertIntoPartial();
  $("#user-reviews-show")[0].innerHTML = template(results);
  })
 })
}
 

 
 $(".users.show").ready(attachListeners)




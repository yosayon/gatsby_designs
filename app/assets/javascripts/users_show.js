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
  let newOrder = new Order(response.order)
  let template = newOrder.orderShowTemplate();
  let results = newOrder.insertIntoPartial();
  $("#user-orders-show")[0].innerHTML = template(results)
  })
 })
}

const bindReviewHandlers = () =>{
 let id = $(".current_user")[0].id
 $("#button-reviews").click((e) => {
 $.get(`/users/${id}/reviews.json`, (response) => {
  $('#user-reviews').html('');
  response.data.forEach(review => {
   let newReview = new Review(review)
   let reviewHTML = `<li><a href="/users/${id}/reviews/${newReview.id}">${newReview.product_name}: ${newReview.title}</a></li>`
     $("#user-reviews").append(reviewHTML)
   })
   bindReviewShowHandlers();
  })
 })
}

const bindReviewShowHandlers = () =>{
 $('#user-reviews li a').hover(function(e){
 e.preventDefault();
 $.get(`${this.href}.json`, (response) => {
  let newReview = new Review(response)
  let template = Handlebars.compile($("#review-show-template")[0].innerHTML);
  let results = {
    product_picture_path: `/products/${newReview.product_id}`, 
    product_picture: `${newReview.product_picture}`, 
    product_name: `${newReview.product_name}`, 
    product_rating: `${newReview.product_rating}`,
    user_email: `${newReview.user_email}`, 
    title: `${newReview.title}`, 
    review: `${newReview.comment}`};
  $("#user-reviews-show")[0].innerHTML = template(results);
  })
 })
}

 function handlebarsSetup(){
  Handlebars.registerPartial('lineItemPartial', $("#line-item-partial")[0].innerHTML);
 }
 
 $(".users.show").ready(attachListeners)




function attachListeners(){
 handlebarsSetup();
 bindOrderHandlers();
 bindReviewHandlers();
}

const showOrder = function(order){
 
}

//  <div class="orders-container">
//   <h3>Order# {{order_id}}</h3>
  
//   {{#each line_items}}
//   {{>line_item_partial}}
//   {{/each}}
  
//  <p>Total: {{total}}</p>
//  <p>This order was processed on {{date}}</p>
// </div>

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
   bindOrderShowHandlers();
  })
 })
}

const bindOrderShowHandlers = () => {
 $('#user-orders li a').click(function(e){
 e.preventDefault();
 $.get(`${this.href}.json`, (response) => {
  console.log(response.data)
  let newOrder = new Order(response.data)
  console.log(newOrder);
  })
 })
}

function Order(order){
 this.id = order.id,
 this.user_id = order.attributes["user-id"],
 this.created_at = order.attributes["created-at"],
 this.line_items = order.relationships["line-items"],
 this.products = order.relationships["products"]
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

Order.prototype.orderShowTemplate = function(){
 let template = Handlebars.compile($("#order-show-template")[0].innerHTML)
 return template;
}

const bindReviewHandlers = () =>{
 let id = $(".current_user")[0].id
 $("#button-reviews").click((e) => {
 $.get(`/users/${id}/reviews.json`, (response) => {
  $('#user-reviews').html('');
  response.data.forEach(review => {
   let newReview = new Review(review)
   let reviewHTML = `
     <li><a href="/users/${id}/reviews/${newReview.id}">${newReview.title}</a></li>
     `
     $("#user-reviews").append(reviewHTML)
   })
  })
 })
}

 function Review(review){
  this.id = review.id,
  this.title = review.attributes.title,
  this.comment = review.attributes.comment,
  this.user_id = review.attributes.user_id,
  this.product_id = review.attributes.product_id
 }
 
 function handlebarsSetup(){
  Handlebars.registerPartial('recipeDetailsPartial', $("#line-item-partial")[0].innerHTML)
 }

$(".users.show").ready(attachListeners)

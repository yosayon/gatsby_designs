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
  let newOrder = new Order(response.data)
  console.log(newOrder);
  let template = newOrder.orderShowTemplate();
  let results = newOrder.insertIntoPartial();
  $("#user-orders-show")[0].innerHTML = template(results)
  })
 })
}

function Order(order){
 this.id = order.id,
 this.user_id = order.attributes["user-id"],
 this.created_at = order.attributes["created-at"],
 this.line_items = order.relationships["line-items"].data,
 this.products = order.relationships["products"].data
}

Order.prototype.insertIntoPartial = function(){
 let order_id = this.id;
 let products = this.products;
 let total = this.total();
 let date = this.formatTime();
 line_items = [];
 for(let i = 0; i < products.length; i++){
   let obj = {
    product_picture_path: `/products/${products[i].id}`,
    product_picture: `${products[i].picture}`,
    product_name: products[i].name,
    product_price: Math.floor(products[i].price),
    quantity: this.line_items[0].quantity
   }
  line_items.push(obj);
 }
 return {order_id, line_items,total,date}
 console.log(line_items);
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

Order.prototype.total = function(){
 let prices = [];
 let total = 0;
  for(let i = 0; i < this.products.length; i++){
   prices.push(Math.floor(this.products[i].price * this.line_items[i].quantity))
  }
  return total = prices.reduce((sum,val) => sum + val);
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
  Handlebars.registerPartial('lineItemPartial', $("#line-item-partial")[0].innerHTML);
 }

$(".users.show").ready(attachListeners)

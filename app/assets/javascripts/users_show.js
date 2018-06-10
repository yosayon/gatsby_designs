let getOrders = function(orders){
 let id = $(".current_user")[0].id
 var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
  $.get(`/users/${id}/orders`, function(orders){
   orders.map(function(order){
   var order_date  = new Date(order.created_at);
    $('#user-orders').append(`<li><a href="/users/${id}/orders/${order.id}">
    Order Number: ${order.id}: ${order_date.toLocaleDateString("en-US")}</a>
    </li>`);
   })
 }).done(showOrders)
}

let attachListeners = function(){
 $("#button-orders").click(function(e){
  console.log("I just hijacked this button!");
  if ($("#user-orders").text() === ""){
   getOrders(this)
  }
 })
}

let showOrders = function(){
 $("#user-orders li a").click(function(e){
  e.preventDefault();
  console.log("I just hijacked this user_order_path!");
  
  })
}

$(".users.show").ready(attachListeners);

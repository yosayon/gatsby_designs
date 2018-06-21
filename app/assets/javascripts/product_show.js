Product.attachBackNextHandlers = () => {
 console.log("hitting home")
 $("#back").click(Product.goBack)
 $("#next").click(Product.goNext)
}

Product.goBack = function(){
 console.log("going back")
 let id = parseInt($("#back").attr("data-id"));
 id === 1 ? id = 1 : id--
 $.get("/products/" + id + ".json", function(data){
  let product = new Product(data.product)
 })
 
}

Product.goNext = function(){
 console.log("I'm going next")
}


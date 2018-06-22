Review.getReviewForm = () => {
 $("#button-reviews").click(function(e){
  let id = parseInt($("#button-reviews").attr("data-id"));
  let url = `/products/${id}/reviews/new`
  $.get(url, (response) => {
   let form = response;
   $("#review-form-container")[0].innerHTML = form
   Review.submitReview(form)
  })
 })
}

Review.submitReview = function(form){
 $("#new_review").submit(function(e){
  e.preventDefault();
   let $form = $(this);
   let action = `${$form.attr("action")}.json`;
   let params = $form.serialize();
   $.post(action, params)
   .success(Review.toggleReviewForm(form),Review.success)
   .fail(Review.toggleReviewForm(form), Review.fail)
  })
}

Review.toggleReviewForm = function(form){
 $("#review-form-container")[0].innerHTML = form
 Review.submitReview(form)
}

 Review.fail = function(xhr){
  let errors = xhr.responseJSON.error
  let fields = xhr.responseJSON.text
  
  for(let attribute in errors){
   if(attribute === "title"){
    $(".field ").eq(0).removeClass('field ').addClass('field field_with_errors')
    $("#title-error")[0].innerHTML = errors[attribute][0]
   }else{
    $("#review_title").val(fields.title)
   }
   if(attribute === "comment"){
    $(".field ").eq(1).removeClass('field ').addClass('field field_with_errors')
    $("#comment-error")[0].innerHTML = errors[attribute][0]
   }else{
    $("#review_comment").val(fields.comment)
   }
   if(attribute === "product_rating"){
    $("#rating-error")[0].innerHTML = errors[attribute][0]
   }else{
     $(`input#review_product_rating_${fields.product_rating}`).prop('checked', true)
   }
  }
 }
 
Review.success = function(response){
  let newReview = new Review(response.review)
  let review = newReview.renderProductReviewTemplate();
  $("#product-review-container").prepend(review)
}

const compileTemplates = () => {
 Product.templateProductSource = $("#product-show-template").html() || ''
 Product.templateForProductShow = Handlebars.compile(Product.templateProductSource)
 Review.templateProductSource = $("#product-review-template").html() || ''
 Review.templateForProductReview = Handlebars.compile(Review.templateProductSource)
}

Product.addToCart = () =>{
 $("#button-add-to-cart").click(function(){
  let id = parseInt($("#button-add-to-cart").attr("data-id"))
  $.post(`/products/${id}/line_items`)
  $("#added").toggle('fast')
 })
 
}

$(".products.show").ready(() => {
 compileTemplates();
 Review.getReviewForm();
 Product.addToCart();
})



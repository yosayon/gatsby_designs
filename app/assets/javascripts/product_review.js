Review.getReviewForm = () => {
 $("#button-reviews a").click(function(e){
  e.preventDefault();
  let url = this.href
  $.get(`${this.href}`, (response) => {
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
   let posting = $.post(action, params)
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
 console.log("It was a success!!!")
  let newReview = new Review(response.review)
  let review = newReview.renderProductReviewTemplate();
  $("#product-review-container").append(review)
}

$(".products.show").ready(() =>{
 compileTemplates();
 Product.attachBackNextHandlers();
 Review.getReviewForm();
})

const compileTemplates = () => {
 Product.templateProductSource = $("#product-show-template").html() || '';
 Product.templateForProductShow = Handlebars.compile(Product.templateProductSource)
 Review.templateProductSource = $("#product-review-template").html() || '';
 Review.templateForProductReview = Handlebars.compile(Review.templateProductSource);
}



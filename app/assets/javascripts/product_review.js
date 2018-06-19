Review.toggleReviewForm = () => {
 $("#button-reviews a").click(function(e){
  e.preventDefault();
  $.get(`${this.href}`, (response) => {
   let form = response;
   $("#review-form-container")[0].innerHTML = form
   Review.submitNewReview();
   Review.displayFormErrors();
  })
 })
}

Review.submitNewReview = function(){
 $("#new_review").submit(function(e){
  e.preventDefault();
  let $form = $(this);
  let action = `${$form.attr("action")}.json`;
  let params = $form.serialize();
  $.post(action, params)
  .always(Review.displayFormErrors)
 })
}

Review.success = function(data){
  $("#review-form-container")[0].innerHTML = ''
  $("div.field")[0].className === 'field '
  $("#title-error, #comment-error, #rating-error").innerHTML = '';
  $(':input[type="submit"]').prop('disabled', false);
  let newReview = new Review(data)
  let review = review.renderProductReviewTemplate();
  $("#product-review-container").append(review)
   Review.displayFormErrors(json)
}


Review.displayFormErrors = function(json){
 let title = $("input#review_title").val()
 let comment = $("input#review_comment").val()
 let radio = $(":input[type='radio']").filter(":checked");

 if(title && comment && radio){
  $("#new_review").submit(function(e){
  e.preventDefault();
  let $form = $(this);
  let action = `${$form.attr("action")}.json`;
  let params = $form.serialize();
   $.post(action, params)
   .success(Review.success)
   })
 }else{
   let errors = json[1]
   if ($("div.field")[0].className === 'field '){
   $("div.field").toggleClass(' field_with_errors')
   }
   errors.title ? $("#title-error")[0].innerHTML = errors.title[0] : $("#title-error")[0].innerHTML = ''
   errors.comment ? $("#comment-error")[0].innerHTML = errors.comment[0] : $("#comment-error")[0].innerHTML = ''
   errors.product_rating ? $("#rating-error")[0].innerHTML = errors.product_rating[0] : $("#rating-error")[0].innerHTML = ''
   $(':input[type="submit"]').prop('disabled', false);
   Review.submitNewReview();
 }
}


$(".products.show").ready(() =>{
 Review.templateProductSource = $("#product-review-template").html();
 Review.templateForProductReview = Handlebars.compile(Review.templateProductSource);
 Review.toggleReviewForm();
})

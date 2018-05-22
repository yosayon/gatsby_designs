module ApplicationHelper

 def show_email_if_signed_in
  if logged_in?
   render :partial => 'layouts/nav_email'
  else
   render :partial => 'layouts/nav_sign_in'
  end
 end
 
end

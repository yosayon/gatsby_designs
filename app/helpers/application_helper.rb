module ApplicationHelper

 def show_name_if_signed_in
  if logged_in?
   render :partial => 'layouts/nav_name'
  else
   render :partial => 'layouts/nav_sign_in'
  end
 end
 
end

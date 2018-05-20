module ApplicationHelper
 
 def show_name_if_signed_in
  if logged_in?
   if current_user.name == "temp_user"
    render :partial => 'layouts/nav_sign_in'
   else
    render :partial => 'layouts/nav_name'
   end
  else
   render :partial => 'layouts/nav_sign_in'
  end
 end
 
end

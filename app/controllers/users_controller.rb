class UsersController < Clearance::UsersController
  def create
  	@user = user_from_params

  	if @user.save
  		sign_in @user
  		redirect_to welcome_path
  	else
  		render template: "users/new"
  	end
  end
end

#when you create a users controller.
#inherit clearance:UserController 
#and change redirect_to *page you want*
class UsersController < Clearance::UsersController
  
  def edit
  end

  def new
  end

  def redirect_signed_in_user
  	if signed_in?
  		redirect_to "/welcome"
  	end 
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		sign_in @user
  		redirect_to welcome_path
  	else
  		render template: "users/new"
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end

#when you create a users controller.
#inherit clearance:UserController 
#and change redirect_to *page you want*
class UsersController < ApplicationController
  def ssl_configured?
    false
  end
  
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :role, :password, :password_confirmation)
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "User created successfully"
    else
      render :new
    end
  end

end

class RegistrationController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_url, notice: "Thank you for registering. you can login now !"
    else
      flash.now[:error] = "Something went wrong. Please check your data and try again. errors: #{@user.errors.inspect}"
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end

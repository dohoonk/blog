class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged In"
    else
      render :new
    end
  end

  def edit
    if current_user != nil && @user.id == session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    user_params = params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
    @user = User.find(params[:id])
    if @user.update user_params
    redirect_to root_path, notice: "Updated"
    else
      render :edit
    end
  end

  def change_password
    
  end

end

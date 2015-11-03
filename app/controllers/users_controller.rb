class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # redirect_to user_path(@user)  -- line 10 and 11 do the same thing
      redirect_to @user
    else
      #implement later
    end

    def show

    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end

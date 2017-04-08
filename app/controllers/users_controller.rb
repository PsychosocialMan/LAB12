class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup', :alert => 'Проверьте введенные значения!'
    end
  end

  private def user_params
    params.require(:users).permit(:login, :password, :password_confirmation)
  end

  def new
  end
end

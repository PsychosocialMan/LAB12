class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_login(params[:login])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login', :alert => 'Неверный логин или пароль!'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end

class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.find_by(email: params[:user][:email],
    password: params[:user][:password])
    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Has ingresado'
    else
      redirect_to root_path, alert: 'Tus credenciales no son validas'
    end
  end
  def destroy
    reset_session
    redirect_to root_path
  end
end

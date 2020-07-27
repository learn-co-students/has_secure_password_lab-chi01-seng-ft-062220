class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.try(:authenticate, params[:user][:password]) == false
      redirect_to '/users/new'
    else
      session[:user_id] = @user.id
      redirect_to '/users/home'
    end
  end
end

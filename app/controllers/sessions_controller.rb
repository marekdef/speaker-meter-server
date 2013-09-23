class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_url, :notice => "Logged in!"
    else
      flash[:notice] = "Invalid name or password"
      render "new"
    end
  end
end

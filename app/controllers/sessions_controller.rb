class SessionsController < ApplicationController

  def registration


  end

  def create
    user = (User.where(:mail => params[:mail]))[0]
    if user && (user[:password] == (params[:password]))
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end

class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.find_by_email(params[:session][:email])
      session[:user_id] = user.id
      cookies.permanent[:user_id] = user.id

      redirect_to root_url, :notice => 'You have successfully logged in!'
    else
      flash.now[:error] = 'That email address was not found'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete(:user_id)

    redirect_to root_url, :notice => 'You are now logged out.'
  end

end

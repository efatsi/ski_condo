class UsersController < ApplicationController
  before_filter :assign_user, :only => :show
  before_filter :require_login, :only => [:show, :index]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Welcome to the site!"
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  private

  def assign_user
    @user = User.find(params[:id])
  end

  def require_login
    if !logged_in?
      flash[:error] = "You must be logged in to see User details"
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone_number)
  end
end

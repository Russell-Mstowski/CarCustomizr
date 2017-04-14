class UsersController < ApplicationController
  
  def new
    @all_cars = Car.all
    render 'new.html.erb', layout: 'application4.html.erb'
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password])

    if user.save
      session[:user_id] = user.id
      redirect_to '/home'
    else
      redirect_to '/signup'
    end
  end

  def show
    @all_cars = Car.all
    @cars = Car.all
    @user = User.find_by(id: params[:id])
    @user_customizations = @user.customizations
    render 'show.html.erb'
  end

end

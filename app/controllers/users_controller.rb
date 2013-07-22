class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      data = {
        redirect_to: user_path(@user.username)
      }
      render json:data, status: :unprocessable_entity
    else
      @user.errors.delete(:password_digest)
      data = {
        html: view_context.render('shared/signup', user: @user)
      }
      render json:data, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by_username(params[:username])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    session[:user_id] = @user.id
    redirect_to user_path(@user.username)
  end

end

class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.username)
    else      
      @user.errors.delete(:password_digest)
      flash[:errors_sign] = @user.errors.full_messages
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

end

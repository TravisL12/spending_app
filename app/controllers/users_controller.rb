class UsersController < ApplicationController

  before_filter :authenticate_user!, only: [:edit, :update]
  include UsersHelper

  def new
    @user = RegularUser.new
  end

  def create
    if request.env["omniauth.auth"].present?

      oauth = OAuthUser.new(request.env["omniauth.auth"], current_user)
      oauth.login_or_create
      session[:user_id] = oauth.user.id
      redirect_to root_path
    else
      @user = RegularUser.new(params[:regular_user])
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.username)
      else
        @user.errors.delete(:password_digest)
        flash[:errors_sign] = @user.errors.full_messages
        redirect_to root_path
      end
    end
  end

  def show
    @user = current_user
  end

end

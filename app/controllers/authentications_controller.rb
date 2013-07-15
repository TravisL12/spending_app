class AuthenticationsController < ApplicationController

  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    @user = Authentication.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
    @user = find_user(auth, @user)

    session[:user_id] = @user.id
    flash[:notice] = "Authentication successful."
    redirect_to user_path(@user.username)
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to root
  end

end

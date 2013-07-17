class AuthenticationsController < ApplicationController

  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    @user = Authentication.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])

    if auth['provider'] == 'facebook' && User.find_by_email(auth['info']['email'])
      @user = find_user(auth, @user)
      session[:user_id] = @user.id
      redirect_to user_path(@user.username)
    else
      @user = create_user(auth, @user)
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to root
  end

end

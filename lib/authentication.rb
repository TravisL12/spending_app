module Authentication

  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    end
  end

  def authenticate_user(info)
    @user = User.find_by_email(info[:email])
    if @user && @user.authenticate(info[:password])
      session[:id] = @user.id
      redirect_to questions_path
    else
      @user = User.new
      @user.errors.add(:login, "error: bad email or password")
      render :login
    end
  end
end

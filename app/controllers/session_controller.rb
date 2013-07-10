class SessionController < ApplicationController

	def login
		@user = RegularUser.find_by_username(params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user.username)
		else
			flash[:errors_login] = ["Invalid username or password"]
			redirect_to root_path
		end
	end

	def logout
		session.clear
		redirect_to root_path
	end

end

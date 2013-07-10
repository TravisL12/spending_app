module UsersHelper

	def current_user
      @current_user ||= RegularUser.find(session[:user_id]) if session[:user_id]
	end

end

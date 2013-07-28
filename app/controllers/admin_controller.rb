class AdminController < ApplicationController
	before_filter :require_login
	layout "admin_layout"
	# http authentication here

	helper_method :current_user

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def require_login
		unless user_is_logged_in?
			render "sessions/new", layout: "login_layout"
		end
	end

	def user_is_logged_in?
    !!session[:user_id]
  end
end

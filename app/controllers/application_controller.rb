class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	helper_method :current_user
	helper_method :is_admin?

	def authenticate
		if user = authenticate_with_http_basic do |u, p|
				User.authenticate(u, p)
			end
			@_current_user = user
		else
			request_http_basic_authentication
		end
	end
	def is_admin?
			current_user && current_user.admin
	end

	def current_user
		@_current_user || nil
	end
	def current_artist
		@_current_artist ||= session[:current_artist_id] &&
			Artist.find( session[:current_artist_id])
	end
end

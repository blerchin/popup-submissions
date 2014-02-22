class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	helper_method :current_user
	helper_method :is_admin?

	def get_user
		authenticate_with_http_basic do |u, p|
				User.authenticate(u, p)
		end
	end

	def authenticate
		if user = get_user
			user
		else
			request_http_basic_authentication
		end
	end
	def authorize(authorized_artist_id)
		unless authorized_artist_id && 
					 current_artist &&
						current_artist.id == authorized_artist_id
			authenticate
		end
	end
	def is_admin?
			current_user && current_user.admin
	end

	def current_user
		get_user
	end
	def current_artist
		@_current_artist ||= session[:current_artist_id] &&
			Artist.find_by_id( session[:current_artist_id])
	end
end

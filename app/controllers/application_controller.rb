class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	private
	def current_artist
		@_current_artist ||= session[:current_artist_id] &&
			Artist.find( session[:current_artist_id])
	end
end

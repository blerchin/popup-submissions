class ArtistMailer < ActionMailer::Base
  default from: "no-reply@wallapopup.com"

	def signup_email(artist)
		@artist = artist
		@login_url = "#{artist_url(artist)}/?access_token=#{@artist.access_token}"
		mail(to: @artist.email, subject: "DO NOT DELETE -- wallaPopUp submission info")
	end
end

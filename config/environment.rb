# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
FullView::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
								address: 							"smtp.gmail.com",
								port: 								"587",
								user_name: 						"mhzmaster@gmail.com",
								password: 						"Baruchlieb0724",
								authentication: 			:plain,
								enable_starttls_auto: true,
}

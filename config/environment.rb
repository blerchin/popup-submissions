# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
FullView::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
								address: 							"smtp.mandrillapp.com",
								port: 								"587",
								user_name: 						"app22431408@heroku.com",
								password: 						"di2a4N9JtKeogX1uakkb4g",
								authentication: 			:plain
}

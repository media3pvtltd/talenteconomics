# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Talentecnms::Application.initialize!
ActionController::Streaming::X_SENDFILE_HEADER = 'X-Accel-Redirect' 

ActionMailer::Base.smtp_settings = {
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "gmail.com",
   :user_name => "info33.plgaonline@gmail.com",
   :password => "talenteconomics",
}


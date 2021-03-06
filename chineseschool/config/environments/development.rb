# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Mailer configuration
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :address => 'mail.to-cs.org',
  :port => 26,
  :authentication => :login,
  :user_name => '',
  :password => ''
}
config.action_mailer.default_charset = "utf-8"

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

# Initialize ActiveMerchant for testing
# This requires test account key file, which is NOT included in the github commit
ActiveMerchant::Billing::Base.mode = :test
ActiveMerchant::Billing::LinkpointGateway.pem_file = File.read "#{RAILS_ROOT}/lib/key/1909689160.pem"
::LINKPOINT_GATEWAY = ActiveMerchant::Billing::LinkpointGateway.new(:login => '1909689160')

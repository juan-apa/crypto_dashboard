require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsStarter
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    ActionMailer::Base.smtp_settings = {
      address: 'smtp.sendgrid.net',
      authentication: :plain,
      domain: ENV['SERVER_HOST'],
      enable_starttls_auto: true,
      password: ENV['SENDGRID_API_KEY'],
      port: 587,
      user_name: 'apikey'
    }

    config.action_mailer.default_url_options = { host: ENV['SERVER_HOST'] }
    config.action_mailer.default_options = { from: 'no-reply@api.com' }
  end
end

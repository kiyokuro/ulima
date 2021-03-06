require_relative 'boot'
require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ulima
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.i18n.default_locale = :ja
    config.eager_load_paths += %W(#{config.root}/lib/validator)

    if Rails.env.test?
      config.mail_domain = 'example.com'
    else
      config.mail_domain = ENV['COMMUNITY_EMAIL_DMAIN']
    end
  end
end

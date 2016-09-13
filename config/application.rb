require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FoodApp
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*',
                 :headers => :any,
                 :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
                 :methods => [:get, :post, :put, :patch, :delete, :options]
      end
    end
    config.active_record.raise_in_transactional_callbacks = true
    config.api_only = false
  end
end

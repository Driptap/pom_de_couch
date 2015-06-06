require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PomDeCouch
  class Application < Rails::Application

    facebook_app_id = "1570467919883204"
    facebook_app_secret = "2fae710917a10a819a014936d91591f8"
    
    Rails.application.config.middleware.use OmniAuth::Builder do 
        provider :facebook, facebook_app_id, facebook_app_secret, ssl: {verify: false}, scope: "public_profile"
    end
  end
end

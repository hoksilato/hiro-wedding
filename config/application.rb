require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wedding
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec
      g.view_specs = false
      g.helper_specs = false
      g.javascripts = false
      g.stylesheets = false
      g.helper = false
      g.decorator = false
    end

    config.serve_static_assets = true
  end
end

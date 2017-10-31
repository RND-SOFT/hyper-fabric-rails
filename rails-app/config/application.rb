require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    Slim::Engine.set_default_options(
      attr_list_delims: {'(' => ')', '[' => ']'},
      code_attr_delims: {'(' => ')', '[' => ']'},
      format: :html
    )
    
    config.autoload_paths += %W(#{config.root}/lib #{config.root}/app/services)

  end
end
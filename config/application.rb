require_relative 'boot'

require 'rails/all'
require_relative 'initializers/version'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuruReplay
  include Version

  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.autoload_paths << "#{Rails.root}/lib/clients"

    config.time_zone = "Astana"
    config.i18n.available_locales = [:ru, :en] 
    config.i18n.default_locale = :ru

    # config.i18n.fallbacks = {'ru' => 'en'}

    # config.before_initialize { TestGuruReplay::VERSION }

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
  end

end

require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module EventbriteClone
  class Application < Rails::Application
    config.load_defaults 8.0

    config.i18n.default_locale = :fr
    config.i18n.available_locales = [:en, :fr]   # <-- ajouter cette ligne

    # Optionnel, pour charger tous les fichiers de traduction
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
  end
end

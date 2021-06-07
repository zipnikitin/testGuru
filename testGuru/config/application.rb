require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.timezone = 'Moscow'
    config.i18n.default_locale = :ru
  end
end
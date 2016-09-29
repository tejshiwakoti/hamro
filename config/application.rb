require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Hamro
  class Application < Rails::Application
    config.mongoid.logger = Logger.new($stdout, :warn)
    config.mongoid.preload_models = false

    config.generators do |g|
      g.orm :mongoid
    end
  end
end

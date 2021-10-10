# frozen_string_literal: true

dev = ENV['RACK_ENV'] == 'development'

if dev
  require 'logger'
  require 'byebug'
  logger = Logger.new($stdout)
end

require 'rack/unreloader'
Unreloader = Rack::Unreloader.new(subclasses: %w'Roda Sequel::Model Dry::Struct Dry::Validation::Contract', logger: logger, reload: dev){ LearningSession }
require_relative 'models'
Unreloader.require('app.rb'){'LearningSession'}

# CORS Middleware
require 'rack/cors'
use Rack::Cors, debug: dev do
  allow do
    origins *ENV['ALLOWED_ORIGINS'].split(',').map { |o| o.strip.freeze }.freeze

    resource '/items/*',
      headers: :any,
      methods: %i[get post],
      max_age: 0
  end
end

run(dev ? Unreloader : LearningSession.freeze.app)

freeze_core = !dev
if freeze_core
  begin
    require 'refrigerator'
  rescue LoadError
  else
    require 'tilt/sass' unless File.exist?(File.expand_path('../compiled_assets.json', __FILE__))

    require 'yaml'
    Gem.ruby

    Refrigerator.freeze_core
  end
end

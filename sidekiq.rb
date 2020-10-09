require 'sidekiq-pro'
require_relative 'sleepy_worker'
class Sidekiq::CLI; def print_banner; end end

Sidekiq.configure_server do |config|
  config.super_fetch!
  config.reliable_scheduler!
end

require 'sidekiq-pro'

class SleepyWorker
  include Sidekiq::Worker

  def perform(opts)
    sleep opts['sleep'].to_i
  end
end

require 'sidekiq/pro/web'

map '/' do
  run Sidekiq::Web
end

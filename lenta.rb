require 'bundler/setup'
Bundler.require(:default)
require './feeds_updater'

set :cache, Dalli::Client.new
FeedsUpdater.update

get '/' do
  @articles = settings.cache.get("politcis")

  erb :index
end

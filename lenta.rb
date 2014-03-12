require 'bundler/setup'
Bundler.require(:default)
require './feeds_updater'

set :cache, Dalli::Client.new
FeedsUpdater.update

get '/' do
  @feeds = {}
  feeds_names = ['politics', 'world', 'economy', 'science', 'sport', 'culture', 'eco']

  feeds_names.each do |feed_name|
    @feeds[feed_name] = settings.cache.get(feed_name)
  end


  puts @feeds
  erb :index
end

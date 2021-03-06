require 'bundler/setup'
Bundler.require(:default)
require './feeds_updater'

set :cache, Dalli::Client.new
FeedsUpdater.update

set :feeds_names, ['politics', 'world', 'economy', 'science', 'sport', 'culture', 'eco', 'incidents']

get '/' do
  @feeds = {}


  settings.feeds_names.each do |feed_name|
    @feeds[feed_name] = settings.cache.get(feed_name)
  end

  erb :index
end

get '/rubrics/:name/' do

  @feeds = {}


  settings.feeds_names.each do |feed_name|
    @feeds[feed_name] = settings.cache.get(feed_name)
  end
  
  if settings.feeds_names.include?(params[:name])
    @feed = settings.cache.get(params[:name])
    erb :rubric
  else
    status 404
  end

end

get '/info/posts/statement/' do
  erb :statement
end


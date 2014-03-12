require 'sinatra'

require 'rss'
require 'open-uri'
require 'feedzirra'


get '/' do
  url = 'http://ria.ru/export/rss2/politics/index.xml'
  feed = Feedzirra::Feed.fetch_and_parse(url)
  @articles = feed.entries

  erb :index
end

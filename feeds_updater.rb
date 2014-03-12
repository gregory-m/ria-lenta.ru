require 'dalli'
require 'memcachier'

FEEDS = [
  {name: 'politics', url: 'http://ria.ru/export/rss2/politics/index.xml'},
  {name: 'world', url: 'http://ria.ru/export/rss2/world/index.xml'},
  {name: 'economy', url: 'http://ria.ru/export/rss2/economy/index.xml'},
  {name: 'science', url: 'http://ria.ru/export/rss2/science/index.xml'},
  {name: 'sport', url: 'http://sport.ria.ru/export/rss2/sport/index.xml'},
  {name: 'culture', url: 'http://ria.ru/export/rss2/culture/index.xml'},
  {name: 'eco', url: 'http://eco.ria.ru/export/rss2/eco/index.xml'}
]

class FeedsUpdater
  def self.update
    cache = Dalli::Client.new
    FEEDS.each do |feed|
      cache.set(feed[:name], Feedzirra::Feed.fetch_and_parse(feed[:url]))
    end
  end
end

require 'dalli'
require 'memcachier'


class FeedsUpdater
  def self.update
    cache = Dalli::Client.new
    politcis_url = 'http://ria.ru/export/rss2/politics/index.xml'
    world_url = 'http://ria.ru/export/rss2/world/index.xml'

    politcis_feed = Feedzirra::Feed.fetch_and_parse(politcis_url)
    world_feed = Feedzirra::Feed.fetch_and_parse(world_url)

    cache.set("politcis", politcis_feed)
    cache.set("world", world_feed)

  end
end

require 'sinatra'

require 'rss'
require 'open-uri'

url = 'http://ria.ru/export/rss2/politics/index.xml'

get '/' do
  erb :index
end

require 'bundler/setup'
Bundler.require(:default)

require './feeds_updater'

desc 'Update feeds'
task :update_feeds do
  puts "Updating feed..."
  FeedsUpdater.update
  puts "done."
end

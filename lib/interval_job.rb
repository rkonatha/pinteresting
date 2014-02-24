require File.expand_path('../../app/models/feed', __FILE__)
require 'feedzirra'

class IntervalJob

	def perform
		lastUpdateTime = Feed.maximum('feed_updated_time')
		if(lastUpdateTime.nil?) then 
			lastUpdateTime = DateTime.new(2000,1,1)
		end
		feed_urls = ["http://www.engadget.com/rss.xml"]
		feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
		feeds.values.each do | feed| 
			entries = feed.entries
			Delayed::Worker.logger.info("Total number of feeds: #{entries.size}")
			entries.select! { |entry| entry.published > lastUpdateTime}
			Delayed::Worker.logger.info("Total number of feeds after filter: #{entries.size}")
			entries.each do |entry|
				f = Feed.new 
				f.title = entry.title    
				f.feed_updated_time = entry.published
				f.summary = entry.summary
				f.content = entry.url
				f.save
			end
		end
		Delayed::Worker.logger.info("Total number of feeds in DB: #{Feed.count}")
	end

end
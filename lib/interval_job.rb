require File.expand_path('../../app/models/feed', __FILE__)
require 'feedzirra'

class IntervalJob

	def perform
		feed = Feedzirra::Feed.fetch_and_parse("http://feeds.feedburner.com/PaulDixExplainsNothing")
	end

end
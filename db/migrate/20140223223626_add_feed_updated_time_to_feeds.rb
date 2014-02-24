class AddFeedUpdatedTimeToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :feed_updated_time, :datetime
  end
end

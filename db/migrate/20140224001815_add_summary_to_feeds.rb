class AddSummaryToFeeds < ActiveRecord::Migration
   def self.up
    add_column :feeds, :summary, :binary, :limit => 1.megabyte
  end

  def self.down
    remove_column :feeds, :summary
  end
end

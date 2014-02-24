class AddContentToFeeds < ActiveRecord::Migration
  def self.up
    add_column :feeds, :content, :binary, :limit => 1.megabyte
  end

  def self.down
    remove_column :feeds, :content
  end
end

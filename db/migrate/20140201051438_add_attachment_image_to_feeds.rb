class AddAttachmentImageToFeeds < ActiveRecord::Migration
  def self.up
    change_table :feeds do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :feeds, :image
  end
end

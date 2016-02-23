class AddChannelTitleToTrendVideo < ActiveRecord::Migration
  def change
    add_column :trend_videos, :channel_title, :string, null: false, after: :channel
    add_column :trend_videos, :category_id, :integer, null: false, default: 0, after: :channel_title
    add_column :trend_videos, :tags, :text, null: false, after: :category_id
  end
end

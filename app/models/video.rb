class Video < ActiveRecord::Base
  attr_accessible :video_id,:title, :video_desc,:video_img,:video_director,
         :video_performer,:video_time,:video_size ,:video_focus,:video_source,:video_url,
         :channel_id,:original_price,:privilege_price,:state,:video_type

  validates :title, :presence => true
  validates :video_director, :presence => true
  validates :video_performer, :presence => true
  validates :video_time, :presence => true
  validates :video_size, :presence => true
  validates :video_focus, :presence => true
  validates :video_source, :presence => true
  validates :privilege_price, :presence => true
  validates :original_price, :presence => true
end

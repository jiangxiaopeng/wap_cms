class Video < ActiveRecord::Base
  attr_accessible :video_id,:title, :video_desc,:video_img,:video_director,
         :video_performer,:video_time,:video_size ,:video_focus,:video_source,:video_url,
         :cid,:original_price,:privilege_price,:state,:video_type

  validates :title, :presence => true
  validates :video_director, :presence => true
  validates :video_performer, :presence => true
  validates :video_time, :presence => true
  validates :video_size, :presence => true
  validates :video_focus, :presence => true
  validates :video_source, :presence => true
  validates :privilege_price, :presence => true
  validates :original_price, :presence => true
  def cms_videos(video,type) 
    new_video = Video.new 
    new_video.video_id = video.video_id 
    new_video.title = video.title 
    new_video.video_desc = video.video_desc 
    new_video.video_img = video.video_img 
    new_video.video_director = video.video_director 
    new_video.video_performer = video.video_performer 
    new_video.video_time = video.video_time 
    new_video.video_size = video.video_size 
    new_video.video_focus = video.video_focus 
    new_video.video_source = video.video_source 
    new_video.video_url = video.video_url 
    new_video.cid = video.cid 
    new_video.original_price = video.original_price 
    new_video.privilege_price = video.privilege_price 
    new_video.state = video.state 
    new_video.video_type = type
    new_video
  end
end

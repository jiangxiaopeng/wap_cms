class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_id         #视频id
      t.string :title            #标题
      t.string :video_desc       #描述
      t.string :video_img        #图片
      t.string :video_director   #导演
      t.string :video_performer  #演员
      t.string :video_time       #时长
      t.string :video_size       #大小
      t.string :video_focus      #看点
      t.string :video_source      #来源
      t.string :video_url      #来源
      t.integer :cid      #频道id
      t.integer :original_price  #原价
      t.integer :privilege_price #优惠价
      t.integer :state           #状态
      t.integer :video_type      # 1频道视频 , 2今日推荐 , 3 精彩推荐
      t.integer :position
      t.timestamps
    end
  end
end

class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :video_id #视频的 id
      t.integer :title #视频的 标题
      t.integer :purchase_count  #购买次数
      t.integer :play_count      #播放次数
      t.timestamps
    end
  end
end

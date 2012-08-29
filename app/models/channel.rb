class Channel < ActiveRecord::Base
  attr_accessible :cid, :title
  validates :cid, :presence => true
  validates :title, :presence => true
end

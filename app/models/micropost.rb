class Micropost < ActiveRecord::Base
  attr_accessible :content, :user_id
  validates :content, :length => { :minimum => 10, :maximum => 140 }
  belongs_to :user
end

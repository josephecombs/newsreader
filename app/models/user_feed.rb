class UserFeed < ActiveRecord::Base
  validates :user, :feed, presence: true
  
  belongs_to :user
  belongs_to :feed
end

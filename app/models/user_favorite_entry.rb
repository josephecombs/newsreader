class UserFavoriteEntry < ActiveRecord::Base
  validates :user, :entry, presence: true
  
  belongs_to :user
  belongs_to :entry
end

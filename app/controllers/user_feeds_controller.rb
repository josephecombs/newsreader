class UserFeedsController < ApplicationController
  def create
    @user_feed = UserFeed.new
    @user_feed.user_id = current_user.id
    @user_feed.feed_id = params[:feed_id]
    
    if @user_feed.save
      render :json => @user_feed
    else
      render :json => @user_feed.errors, status: :unprocessible_entity
    end
    
  end
end
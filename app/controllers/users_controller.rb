class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to user_url(current_user)
  end

  def show
    if params[:id].nil? || params[:id].empty?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @photos = @user.photos.order("updated_at DESC").limit(100)
    if @photos.count > 3
      @title_photos = @photos.sample(3y)
    end
    @photo = Photo.new
  end

  def add_follower
    relation = UsersRelation.new({ follower_user_id: current_user.id, user_id: params[:id].to_i })
    unless relation.save
      render "shared/something_went_wrong"
    end    
    render partial: "users/unfollow_btn"
  end

  def unfollow
    unless UsersRelation.where({ follower_user_id: current_user.id, user_id: params[:id].to_i }).destroy_all
      render "shared/something_went_wrong"
    end
    render partial: "users/follow_btn"
  end
end

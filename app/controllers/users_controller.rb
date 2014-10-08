class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to "/users/#{current_user.id}", :status => :moved_permanently
  end

  def show
    if params[:id].nil? || params[:id].empty?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @photos = @user.photos.limit(100)
    if @photos.count > 3
      @title_photos = Photo.limit(3).offset(rand(Photo.count - 3)).load
    end
    @photo = Photo.new
  end
end

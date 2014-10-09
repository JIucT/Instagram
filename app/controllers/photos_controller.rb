class PhotosController < ApplicationController
  before_action :authenticate_user!
  
  def create
    photo = Photo.new({ name: photo_params[:image].original_filename, user_id: current_user.id, image: photo_params[:image] })
    if !photo_params[:description].nil? && !photo_params[:description].empty?
      photo.description = photo_params[:description]
    end
    unless photo.save
      render "shared/something_went_wrong"
    end
    @photos = current_user.photos.order("updated_at DESC").limit(100)
    render partial: "shared/user_photos"
  end

private
  def photo_params
    params.require(:photo).permit(:image, :name, :description)
  end    
end

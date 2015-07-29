class PhotosController < ApplicationController

  def index
  	@photos = Photo.all.sort_by{|e| e[:created_at]}.reverse!
  	Photo.where(public: false).each do |photo|
  		if photo.user != current_user
  			@photos = @photos - [photo]
  		end
  	end
  end
  	#user photos = current_user.photos
 	# @photos = Photo.where(public: true)
  #   Photo.where(public: false).each do |photo|
  #     if photo.user == current_user
  #       @photos = @photos + [photo]
  #     end
  #   @photos = @photos.sort_by{|e| e[:created_at]}.reverse!
  #   end
  def mine
  	@photos = current_user.photos.sort_by{|e| e[:created_at]}.reverse!
  end

  def new
    if user_signed_in?
      @photo = Photo.new
    else
      redirect_to new_user_session_path
      flash.notice = "You need to sign in first"
    end
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to @photo
    else
      render 'new'
    end
  end

  def like
    @photo = Photo.find(params[:id])
    @photo.liked!
    redirect_to @photo
  end

  def show
    @photo = Photo.find params[:id]
  end

  def edit
    @photo = Photo.find params[:id]
    if @photo.user != current_user
    	redirect_to photo_path, alert: "invalid permissions"
    end
    render 'edit'
  end

  def update
    @photo = Photo.find params[:id]
    if @photo.update photo_params
      redirect_to @photo
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find params[:id]
    if @photo.user == current_user
      @photo.destroy
      redirect_to photos_path
      flash.notice = "Photo successfully deleted"
    else
      redirect_to photo_path
      flash.alert = "Invalid Permissions"
    end
  end


  private

    def photo_params
      params.require(:photo).permit(:public, :caption, :image)
    end



end

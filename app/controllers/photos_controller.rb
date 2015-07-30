class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
  	@photos = Photo.all.order(created_at: :desc)
  	Photo.where(public: false).each do |photo|
  		if photo.user != current_user
  			@photos = @photos - [photo]
  		end
  	end
  end

  def myphotos
  	@photos = current_user.photos.order(created_at: :desc)
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
    if (@photo.user != current_user) && (@photo.public == false)
      redirect_to photos_path
    end

  end

  def edit
    @photo = Photo.find params[:id]
    verify_photo_owner
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

    if @photo.user != current_user
        redirect_to photo_path
        flash.alert = "Invalid Permissions"
    else 
      @photo.destroy
      redirect_to photos_path
      flash.notice = "Photo successfully deleted"
    end
  end


  private

    def verify_photo_owner
      if @photo.user != current_user
        redirect_to photo_path
        flash.alert = "Invalid Permissions"
      end
    end

    def photo_params
      params.require(:photo).permit(:public, :caption, :image)
    end



end

class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@photo = Photo.find(params[:photo_id])
		@comment = @photo.comments.create(comment_params)
		if current_user
			@comment.user = current_user
		end
		@comment.save

		if @comment.save
			redirect_to photo_path(@photo)
		end
	end


	def edit
	    @comment = Comment.find params[:id]
	    verify_comment_owner
 	end

  	def update
    	@comment = Comment.find params[:id]
    	if @comment.update comment_params
      		redirect_to @comment
    	else
      		render :edit
    	end
  	end

  	def destroy
  		@photo = Photo.find params[:photo_id]
    	@comment = @photo.comments.find params[:id]
    	if @comment.user != current_user
    		redirect_to photo_path(@photo)
        	flash.notice = "You can't delete others' comments"
    	else
      		@comment.destroy
      		redirect_to photo_path(@photo)
      		flash.notice = "Comment successfully deleted"
      	end
  	end

	private
		def verify_comment_owner
			if @comment.user != current_user
        		redirect_to photo_path
        		flash.notice = "You can't edit others' comments"
      		end
    	end

		def comment_params
			params.require(:comment).permit(:text)
		end
end

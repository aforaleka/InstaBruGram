class CommentsController < ApplicationController
	def create
		@photo = Photo.find(params[:photo_id])
		@comment = @photo.comments.create(comment_params)
		redirect_to photo_path(@photo)
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
      		render 'edit'
    	end
  	end

  	def destroy
    	@comment = Comment.find params[:id]
    	verify_comment_owner
    	
      	@photo.destroy
      	redirect_to photo_path
      	flash.notice = "Comment successfully deleted"

  	end

	private
		def verify_comment_owner
			if @comment.user != current_user
        		redirect_to photo_path
      		end
    	end

		def comment_params
			params.require(:comment).permit(:text)
		end
end

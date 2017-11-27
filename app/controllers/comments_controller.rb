class CommentsController < ApplicationController
	before_action :set_comment, only: [:edit]
  def edit
  end

  def create
  	@comment = Comment.new(comment_params)
  	respond_to do |format|
  		if @comment.save
  			format.html {redirect_to blog_post_url(id: @comment.blog_post_id), notice: "Comment was created!!"}
  		else
  			format.html {redirect_to :back, notice: "Comment was not saved!!"}
  		end
  	end
  end
  
  def update
  	respond_to do |format|
  		if @comment.update(comment_params)
  			format.html {redirect_to blog_post_ur(id: @comment.blog_post_id), notice: "Comment was updated!!"}
  		else 
        format.html {render :edit}
  		end
  	end
  end
  

  def destroy
  	@comment.destroy
  	respond_to do |format|
  		format.html {redirect_to blog_post_url(id: @comment.blog_post_id), notice: "Your comment was deleted!!"}
  	end
  end

  private

  def comment_params
  	params.require(:comment).permit(:author, :comment_entry, :blog_post_id)
  end

  def set_comment
  	@comment = Comment.find(params[:id])
  end
end

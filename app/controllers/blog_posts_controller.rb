class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy] #sets the set_blog_post private method to the show, edit, update, and destroy methods.

  def index
  	@blog_posts = BlogPost.all
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def new
  	@blog_post = BlogPost.new
  end

  def create
  	@blog_post = BlogPost.new(blog_post_params)
  	respond_to do |format|
  		if @blog_post.save
  			format.html {redirect_to blog_post_url(@blog_post), notice: "Post was created!!"}
  		else
  			format.html {render :new}
  		end
  	end
  end

  def update
  	respond_to do |format|
  		if @blog_post.update(blog_post_params)
  			format.html{redirect_to blog_post_url(@blog_post), notice: "Post was updated!!"}
  		else
  			format.html{render :edit}
  		end
  	end
  end

  def destroy
  	@blog_post.destroy
  	respond_to do |format|
  		format.html {redirect_to root_url, notice: "Post was deleted!!"}
  	end
  end

  private #this is for security!!

  def blog_post_params
  	params.require(:blog_post).permit(:title, :blog_entry, :author)
  end

  def set_blog_post
  	@blog_post = BlogPost.find(params[:id])
  end
end

class PostsController < ApplicationController
  def index
  	@user = User.find(params[:user_id])
  end

  def new
	@post = Post.new
	@user= User.find(params[:user_id])
  end

  def create
	@post = Post.new(post_params)
	@post.user_id = params[:user_id]
	if @post.save
	    flash[:notice] = "Your post was saved successfully"
		redirect_to user_posts_path
	else
		flash[:notice] = "There was a problem creating a new post for this user"
		redirect_to new_user_post_path
	end
 end

   def post_params
    params.require(:post).permit(:name, :description)
  end
end

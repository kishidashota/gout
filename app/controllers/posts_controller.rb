class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:shop_name, :description,:address,:food_image).merge(user_id: current_user.id)
  end
end

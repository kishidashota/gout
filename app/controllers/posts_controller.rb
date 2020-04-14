class PostsController < ApplicationController
def index
    @post  = Post.all.order("created_at DESC").page(params[:page]).per(12)
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿に成功しました"
    else
      flash[:alert] = "入力内容に誤りがあります。入力漏れをご確認ください。"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def search
    @posts = Post.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def post_params
    params.require(:post).permit(:shop_name, :description,:address, :latitude, :longitude,:food_image,:remove_food_image,tag_ids: []).merge(user_id: current_user.id)
  end
end

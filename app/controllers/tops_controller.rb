class TopsController < ApplicationController
  def index
    @post = Post.all
    @post  = Post.all.order("id DESC")
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
end

  def show
  
  end
end

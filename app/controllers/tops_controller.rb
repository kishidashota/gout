class TopsController < ApplicationController
  def index
    @post  = Post.all.order("created_at DESC").page(params[:page]).per(12)
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
end

  def show

  end
end

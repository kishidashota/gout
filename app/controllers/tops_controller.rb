class TopsController < ApplicationController
  def index
    @post = Post.all
    @post  = Post.all.order("id DESC")
  end
end

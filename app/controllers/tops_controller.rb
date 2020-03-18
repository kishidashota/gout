class TopsController < ApplicationController
  def index
    @post  = Post.all.order("id DESC")
  end
end

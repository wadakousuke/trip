class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      redirect_to post_path(@post)
    else
      render:new
    end
  end

  def index
    @posts = Post.all
  end

  def edit
     @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update
    redirect_to post_path(@post)
  end


private
def post_params
  params.require(:post).permit(:image, :user_id, :title, :body, :category_id, :address, :review, :experience_at)
end
end

class PostsController < ApplicationController
  def index
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = I18n.t('post.success')
      redirect_to root_path
    else
      render 'index'
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

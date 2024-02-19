class PostsController < ApplicationController

  def new
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(post_params)
    @new_post.user_id = @current_user.id

    if @new_post.save
      redirect_to home_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end

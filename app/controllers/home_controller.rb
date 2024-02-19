class HomeController < ApplicationController
  before_action :require_login

  def index
    @posts = Post.all
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end

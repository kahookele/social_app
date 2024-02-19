class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_index_path, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Email or password is invalid'
      render :new, status: :unprocessable_entity
    end
  end
end

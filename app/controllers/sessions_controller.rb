class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
            )
    if user
      sign_in(user)
      redirect_to user_url(user)
    else
      flash.now[:base] = "Invalid error credentials"
      render :new
    end
  end

  def destroy
    sign_out
    render :new
  end
end

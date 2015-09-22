class UsersController < ApplicationController
  before_action :require_signed_in, only: :show

  def new
    render :new
  end

  def show
    User.includes(:goals)
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:base] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def require_signed_in
    redirect_to new_session_url unless signed_in?
  end
end

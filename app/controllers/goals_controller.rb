class GoalsController < ApplicationController
#  before_action :validate_author, only: :show

  def show
    @goal = Goal.find(params[:id])

  end

  def validate_author
    user = User.find(params[:user_id])
    redirect_to user_url(user) unless user.id == current_user.id
  end
end

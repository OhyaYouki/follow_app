class FollowsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def create
    @follow = Relationship.create(user_id: current_user.id, following_id: params[:user_id])
  end

  def destroy
    follow = Relationship.find(params[:id])
    follow.destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  # これはいる？
  # def follow_params
  #   # 「誰(current_user)が」「誰(params[:user_id])を」フォローするか
  #   user_id = current_user.id
  #   following_id = params[:user_id]
  #   params.permit(:user_id).merge(user_id: current_user.id)
  # end
end

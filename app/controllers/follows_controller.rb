class FollowsController < ApplicationController
  def create
    binding.pry
    @follow = Relationship.create(user_id: current_user.id, following_id: params[:user_id])
  end

  def destroy
    binding.pry
    follow = Relationship.find_by(user_id: current_user.id, following_id: params[:user_id])
    follow.destroy
  end

  private

  # これはいる？
  # def follow_params
  #   # 「誰(current_user)が」「誰(params[:user_id])を」フォローするか
  #   user_id = current_user.id
  #   following_id = params[:user_id]
  #   params.permit(:user_id).merge(user_id: current_user.id)
  # end
end

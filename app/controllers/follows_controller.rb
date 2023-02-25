class FollowsController < ApplicationController
  before_action :set_user, only: [:create, :destroy, :user_follow, :user_follower]

  def create
    @follow = Relationship.create(user_id: current_user.id, following_id: params[:user_id])

    # @userがフォローしている人たち
    @following = Relationship.where(user_id: @user.id)

    # @userをフォローしている人たち
    @followed = Relationship.where(following_id: @user.id)
  end

  def destroy
    follow = Relationship.find(params[:id])
    follow.destroy

    # @userがフォローしている人たち
    @following = Relationship.where(user_id: @user.id)

    # @userをフォローしている人たち
    @followed = Relationship.where(following_id: @user.id)
  end

  def user_following
    # @userがフォローしている人たち
    @following = Relationship.where(user_id: @user.id)
  end

  def user_followed
    # @userをフォローしている人たち
    @followed = Relationship.where(following_id: @user.id)
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

class FollowsController < ApplicationController
  before_action :set_user
  before_action :set_following  ,only: [:user_following]
  before_action :set_followed   ,only: [:user_followed]

  def create
    @follow = Relationship.create(user_id: current_user.id, following_id: params[:user_id])

    set_following
    set_followed
  end

  def destroy
    follow = Relationship.find(params[:id])
    follow.destroy

    set_following
    set_followed 
  end

  def user_following
  end

  def user_followed
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_following
    # @userがフォローしている人たち
    @following = @user.followings

    # @following = Relationship.where(user_id: @user.id)
  end

  def set_followed
    # @userをフォローしている人たち
    @followed = @user.followers    

    # @followed = Relationship.where(following_id: @user.id)
  end
end

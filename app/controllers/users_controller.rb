class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    @follow = Relationship.find_by(user_id: current_user.id, following_id: @user)
    
    # @userがフォローしている人たち
    @following = @user.followings
    # @following = Relationship.where(user_id: @user.id)
  
    # @userをフォローしている人たち
    @followed = @user.followers
    # @followed = Relationship.where(following_id: @user.id)

  end

end

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    # 中間テーブルを用いたアソシエーションで値取ってこれる？
    @follow = Relationship.find_by(user_id: current_user.id, following_id: @user)
    
    # @userがフォローしている人たち
    @following = Relationship.where(user_id: @user.id)
  
    # @userをフォローしている人たち
    @followed = Relationship.where(following_id: @user.id)
  end

end

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @follow = Relationship.find_by(user_id: current_user.id, following_id: @user)
    # 中間テーブルを用いたアソシエーションで値取ってこれる？
  end

end

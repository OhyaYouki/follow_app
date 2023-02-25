class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname             , presence:true
  

  has_many :posts

  ## Userモデルに記載のアソシエーション

  # relationship（中間テーブル）とのアソシエーション
  has_many :relationships                                              , foreign_key: "user_id"   # 省略可能
  # 架空のfollowingモデルとのアソシエーション
  has_many :followings            , through:     :relationships        , source:      :following  # following_id参照


  ## 架空のfollowingモデルのアソシエーション

  # 架空のfollowingモデルに記載するはずのrelationship（中間テーブル）とのアソシエーション
  has_many :passive_relationships , class_name: "Relationship"         , foreign_key: 'following_id'
  # 本当はhas_many :usersと書きたいけど書けないからfollowersとしている
  has_many :followers             , through:    :passive_relationships , source:      :user       # user_id参照
end

# 本当はこうしたい
# class following < ApplicationRecord
#   has_many :relationships         , foreign_key: 'following_id'
#   has_many :users                 , through:    :relationships 
# end
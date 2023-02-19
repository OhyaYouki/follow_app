class Post < ApplicationRecord
  belongs_to :user
  
  validates :content         , presence:true, presence: { message: "can't be blank" }
end

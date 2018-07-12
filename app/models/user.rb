class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
          
  has_many :posts
  has_many :replies
  has_many :likes
  has_many :liked_post, through: :likes, source: :post
          
  def is_like?(post) # 실제로 존재하는지 안하는지 찾을 수 있따.
      Like.find_by(user_id: self.id, post_id: post.id).present?
    #   자기 아이디 받아올 때는 self.id
    # post_id를 받아올 수 없어서 매게변수로 받아온다(post)
  end
end

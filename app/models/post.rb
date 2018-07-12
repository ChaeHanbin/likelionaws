class Post < ActiveRecord::Base
    has_many :replies # 뒤에는 복수 형태가 옴
    belongs_to :user
    
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    
    validates :title, presence: true

end

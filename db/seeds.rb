# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..3).each do |i|
    User.create(username: i, email: "#{i}@#{i}.com", password: "111111", password_confirmation: "111111")
    # views/devise/new.htl.erb에 보면 password_conformation이 있다
    # id 1@1, 2@2, 3@3가 만들어진다
    (1..3).each do |j|
        Post.create(title: "#{i}의 #{j}번째 글", content: "#{i}의 #{j}번째 글인데 빨리 끝나면 좋겠다", user_id: i)
        # 한사람당 게시물 3개를 만든다
    end
end

# Post.each {|e| puts e}로 써도 같음
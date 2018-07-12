class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :image # 사진의 경로(문자열)
      # t.string :image, :default => ""
      # t.string :image, default: "" # 요즘꺼
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end

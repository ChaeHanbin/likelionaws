class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :content
      t.integer :post_id # 자기가 연결하고자 하는 모델_id
      # t.belongs_to :post
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

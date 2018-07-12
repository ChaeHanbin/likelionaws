class Reply < ActiveRecord::Base
    belongs_to :post # 하나에 종속되있기 때문에 단수를 씀
    belongs_to :user
end
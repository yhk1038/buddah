class Reply < ActiveRecord::Base
    belongs_to :post
    has_many :under_replies
end

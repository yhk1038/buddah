class Intab < ActiveRecord::Base
    belongs_to :tab
    has_many :posts
end

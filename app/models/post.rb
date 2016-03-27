class Post < ActiveRecord::Base
    belongs_to :intab
    has_many :replies
    has_many :view_count_posts
end

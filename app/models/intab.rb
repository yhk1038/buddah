class Intab < ActiveRecord::Base
    belongs_to :tab
    has_many :posts
    
    def authority_create
        if self.who_can_create == nil
            self.who_can_create = 1
            self.save
            who_can_create = self.authority_create
        end
        
        if self.who_can_create == 10
            who_can_create = '최고관리자'
        elsif self.who_can_create == 9
            who_can_create = '사이트 관리자'
        elsif self.who_can_create == 8
            who_can_create = '직원'
        elsif self.who_can_create == 5
            who_can_create = '일반 관리자'
        elsif self.who_can_create == 3
            who_can_create = '정회원'
        elsif self.who_can_create == 2
            who_can_create = '인터넷회원'
        elsif self.who_can_create < 2
            who_can_create = '전체'
        end
        
        return who_can_create
    end
    
    def authority_read
        if self.who_can_read.nil?
            self.who_can_read = 1
            self.save
            who_can_read = self.authority_read
        end
        
        if self.who_can_read == 10
            who_can_read = '최고관리자'
        elsif self.who_can_read == 9
            who_can_read = '사이트 관리자'
        elsif self.who_can_read == 8
            who_can_read = '직원'
        elsif self.who_can_read == 5
            who_can_read = '일반 관리자'
        elsif self.who_can_read == 3
            who_can_read = '정회원'
        elsif self.who_can_read == 2
            who_can_read = '인터넷회원'
        elsif self.who_can_read < 2
            who_can_read = '전체'
        end
        
        return who_can_read
    end
end

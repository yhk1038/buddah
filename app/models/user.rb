class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_many :pswds
  
  def self.create! user
    user.each do |m|
      u = User.new
      User.attribute_names.each do |x|
        eval("u.#{x} = m[:#{x}]")
      end
      u.password = m[:password]
      u.goraebang4d = m[:password]
      u.save!
    end
  end
end

class Member < User

 # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :projects, :through    => :memberships,
                      :source     => :project,
                      :conditions => 'memberships.manager = 0'
end

class User < ActiveRecord::Base

  has_many :memberships
 
  devise :database_authenticatable, :recoverable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name

  # Validations.
  validates_presence_of :first_name
  validates_presence_of :last_name

  def full_name
    [first_name, last_name].join(' ')
  end
end

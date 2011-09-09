class User < ActiveRecord::Base

  has_many :memberships
  has_many :tasks
  has_many :sent_messages, :inverse_of => :sender, :class_name => 'Message', :foreign_key => :sender_id

  # Setup accessible (or protected) attributes for your model
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name

  # Validations.
  validates_presence_of :first_name
  validates_presence_of :last_name

  def full_name
    [first_name, last_name].join(' ')
  end

  def to_s
    "#{first_name}<#{email}>"
  end
end

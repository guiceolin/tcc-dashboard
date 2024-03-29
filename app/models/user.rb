class User < ActiveRecord::Base

  belongs_to :current_project, :class_name => 'Project'
  has_many :keys
  has_many :memberships
  has_many :tasks
  has_many :deliveries
  has_many :received_messages, :through => :deliveries, :source => :message
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

  def pub_keys
    keys.map(&:name)
  end

  def to_s
    "#{full_name}"
  end
end

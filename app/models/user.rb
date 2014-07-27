class User < ActiveRecord::Base
  has_and_belongs_to_many :admin_roles, :class_name => 'Admin::Role'
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  after_initialize :set_default_role,             :if => :new_record?
  after_initialize :set_default_failed_attempts,  :if => :new_record?

  def set_default_role
    self.admin_roles ||= :user
  end

  def set_default_failed_attempts
    self.failed_attempts ||= 0
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def admin?
    self.admin_roles.include?(Admin::Role.find(3))
  end

end

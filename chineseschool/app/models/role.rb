class Role < ActiveRecord::Base

  ROLE_NAME_SUPER_USER = 'Super User'
  ROLE_NAME_PRINCIPAL = 'Principal'
  ROLE_NAME_REGISTRATION_OFFICER = 'Registration Officer'
  ROLE_NAME_ACCOUNTING_OFFICER = 'Accounting Officer'
  ROLE_NAME_ACTIVITY_OFFICER = 'Activity Officer'
  ROLE_NAME_INSTRUCTION_OFFICER = 'Instruction Officer'
  
  ROLE_NAME_INSTRUCTOR = 'Instructor'
  ROLE_NAME_ROOM_PARENT = 'Room Parent'
  ROLE_NAME_STUDENT_PARENT = 'Student Parent'
  
  ROLE_NAME_CCCA_STAFF = 'CCCA Staff'

  has_and_belongs_to_many :users
  has_and_belongs_to_many :rights, :order => 'controller ASC, action ASC'

  validates_presence_of :name
  validates_uniqueness_of :name

  def authorized?(controller_path, action_name)
    return true if self.name == ROLE_NAME_SUPER_USER
    self.rights.any? { |right| right.authorized?(controller_path, action_name) }
  end
end

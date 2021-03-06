class TrackEventSignup < ActiveRecord::Base
  
  RELAY_GROUP_CHOICES = ['Group 1', 'Group 2', 'Group 3', 'Group 4']
  
  belongs_to :track_event_program
  belongs_to :student, :class_name => 'Person', :foreign_key => 'student_id'
  belongs_to :parent, :class_name => 'Person', :foreign_key => 'parent_id'
  
  validates_presence_of :track_event_program, :student
end

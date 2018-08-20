class Ticket < ApplicationRecord
  belongs_to :student, :class_name => "User"
  belongs_to :ta, :class_name => "User"
  validates :status, inclusion: { in: ["pending", "assigned", "solved"]}
  validates :question, :student_id, presence: true
end

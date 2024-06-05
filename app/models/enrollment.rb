class Enrollment < ApplicationRecord
  belongs_to :student, dependent: :destroy
  belongs_to :course, dependent: :destroy
  has_one :grade

  after_create :create_grade

  def create_grade
    Grade.create(enrollment: self)
  end
end

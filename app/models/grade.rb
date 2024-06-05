class Grade < ApplicationRecord
  belongs_to :enrollment
  after_commit do 
    notify_student
  end

  def notify_student
    enrollment = grade.enrollment
    StudentMailer.with(student: enrollment.student, grade: self, course: enrollment.course).notify_student_grade.deliver_later
  end

  def overall_score
    score = 0
    quarters = 0
    if first_quarter
      score += first_quarter
      quarters += 1
    end
    if second_quarter
      score += second_quarter 
      quarters += 1
    end
    if third_quarter
      score += third_quarter 
      quarters += 1 
    end
    if fourth_quarter
      score += fuorth_quarter 
      quarters += 1
    end
    score / quarters
  end

  def passing_grade 
    case overall_score
      when 0..5 then 'failed'
      when 6..10 then 'passed'
      else "Invalid Score"
    end
  end
end

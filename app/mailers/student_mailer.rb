class StudentMailer < ApplicationMailer
    default from: "scores-no-reply@yourshool.com"
    layout 'mailer'

    def notify_student_grade(user, grade, course)
        @user = user
        @grade = grade
        @course = course
        mail(to: @user.email, subject: 'Your grade has been updated')
    end
end

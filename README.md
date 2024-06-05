# README

This repo was created as part of the picking process for density labs 

Instructions and what I did to resolve them 


We want to create a grades’ system where only some registered admin users can access it and handle the CRUD of students, courses, and regarding a specific student, the CRUD of its grades as well.
 
A student should have at least 2 fields for identifying it, and a course at least one. 
 
A student can take more than one course at a time
 
We only want to authorize full read/write access to the system to some registered users (admins, not teachers).
 
We want to authorize the students to have read access to their own courses and grades
 
Notes:
* A course is year-long and is evaluated per year quarters, that is, the student will be examined on the course four times, (Quarter1, Quarter2, Quarter3 and Quarter4)
* A student can’t have more than one grade per course per quarter
* A grade is a number that could go from 0 to 10, 0-5 is considered “failed”, 6-10 is “passed”.
* We’d like to support student email field and send an email to the student when there is an update on any of its grades or a new grade
* You are free to assume everything that is not explained here.
 
 
Frontend
Admin
* List of all students
    * List of a student’ grades, per quarter. Indicate whether it’s passed or failed.
* List of all courses
    * List of a course’ students
* Forms to create students, courses and grades
* Login/sign in form to access system
* Ability to sign out
Student
* List of all their courses per year
    * List of each of their course’ grades
* Login form to access system
* Ability to sign out



How I tackled some of the project needs

Created the model User that this user can be a student or an admin 
Created a namespace for differnt type of controllers, access to the routes would be handled by each namespace BaseController , this is true for Admin and Student namespaces

![image](https://github.com/del-cueto/densityInterview/assets/16280500/920ffbda-f20f-475f-915b-b6f67515d5bd)

Generate single table inheritance for the User and Student interaction in the models

I generated 4 main models, User, who can be admins or students. Courses which Users can register to trugh Enrollment and Grades, which are Users can interact trough enrollments
Each grade holds the score for each quarter and a couple of methods to check of the overall_score is a passing grade and one to calculate the overall score depending on how many quarters have been filled.
This model also holds a callback to send an email to the user so that they get notified when the grades is created or upated
![image](https://github.com/del-cueto/densityInterview/assets/16280500/4d9102c7-1b27-4c4e-8e8b-f10914b3bf97)

here are some of the requests through google chrome and postman to verify the responses I was getting

Admin users have access to all users 
![Pasted Graphic 1](https://github.com/del-cueto/densityInterview/assets/16280500/3676fce6-d4a8-4f88-bc72-44ceeaada5ff)

Admin users can access other users even if they are not themselves
![localhost3000adminusers2](https://github.com/del-cueto/densityInterview/assets/16280500/0ef4f2d9-735e-42ff-9b51-8ffb03b2618b)

Admin users can edit other users (postman)
![Pasted Graphic 4](https://github.com/del-cueto/densityInterview/assets/16280500/9efa9c79-4eb5-44fd-ac59-8f2ffd0bbe29)

Admin users can see all courses
![Pasted Graphic 5](https://github.com/del-cueto/densityInterview/assets/16280500/2c4b0198-ca36-4570-98ce-2dbebbda82f6)

Admin users can check and edit the grades on each enrollment (enrollment defines that a user is asigned to a course)
![localhost3000adminenrollments2grades](https://github.com/del-cueto/densityInterview/assets/16280500/6ac05308-e1a2-4a0a-89d9-e23763aa8f4b)

Students can only access ther own user information and cannot edit it 
![localhost3000studentusers](https://github.com/del-cueto/densityInterview/assets/16280500/504f28fc-14b3-4daf-b03a-bbd38a928940)

Students can only check their own grades truogh enrollments
![localhost3000studentenrollments3grades](https://github.com/del-cueto/densityInterview/assets/16280500/6d1a6050-8ec5-4995-ab26-dd504b248f84)


important!!!
In order to test in postman I had to add this lines to the admin and student's base controller to allow me to test since rspec tests were not included in the exercise
if they are not removed postman wont be able to pass a CSRF error this was totally a misshap of my design but time was not something I had to re do the whole application as an API only and do everything with json_tokens instead of devise
![image](https://github.com/del-cueto/densityInterview/assets/16280500/e8e5251e-a8b3-4d73-96e0-194df83c4d73)

I am open to reviews and recommendations at carlos.delcueto@live.com

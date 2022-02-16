# Student Enrollment System
## Team_2675

## Content

| S.No | Title | Hyperlink |
| - | - | - |
| 1 | Deployment Information | [Click here](#deployment-information) |
| 2 | Credentials | [Click here](#credentials) |
| 3 | Documentation | [Click here](#documentation) |
| 3 | Edge Case Scenarios | [Click here](#edge-case-scenarios) |
| 4 | Installation Instructions | [Click here](#installation-instructions) |
| 5 | Deployment Instructions | [Click here](#deployment-instructions) |
| 6 | Team Members | [Click here](#team-members) |


## Deployment Information
- Provider: Heroku
- URL: https://fierce-mesa-20166.herokuapp.com/
- Admin credentials - admin@ses.com/admin

## Credentials

Apart from the admin, the environment contains the following user data seeded to ease the testing process.
Login using any of the following credentials.
- **Note: Since users can delete their account, it is not guaranteed that all these accounts will be available at all the time. We will reset the data regularly to make sure these accounts are available.**

| S.No | Role | User Email | Password | 
|-|-|-|-|
| 1. | Admin | admin@ses.com | admin |
| 2. | Instructor | ron@ses.com | instructor |
| 3. | Instructor | leslie@ses.com | instructor |
| 4. | Instructor | chris@ses.com | instructor |
| 5. | Instructor | ben@ses.com | instructor |
| 6. | Student | tom@ses.com | student |
| 7. | Student | andy@ses.com | student |
| 8. | Student | april@ses.com | student |
| 9. | Student | donna@ses.com | student |
| 10. | Student | garry@ses.com | student |
| 11. | Student | ann@ses.com | student |
| 12. | Student | craig@ses.com | student |


## Documentation

### Admin Workflow

  - Edit your details
    + Click on 'Edit Details' button.
    + Make changes and click on 'Save' button.
  - Students
    + Click on 'Show All Students' button from home page to view all Students.
      * Click on show to view student's information.
      * Click on delete account to delete student's acccount.
      * Click on Create A Student button to create a new Student account.
  - Instructors 
    + Click on 'Show All Instructors' button from home page to view all Instructors.
      * Click on show to view instructor's information.
      * Click on delete account to delete instructor's acccount.
      * Click on Create A Instructor button to create a new instructor account.
  - Courses
    + Click on 'Show All Courses' button from home page to view all Courses.
      * Click on Show to view course details.
      * Click on Show and then click on respective option to update/delete the course.
      * Click on Enrolled Students to view all students enrolled in the course. You can drop a student from the course from here.
      * Click on Waitlisted Students to view all students waitlisted in the course. You can drop a student from the course from here.
      * Click on Enroll Student to enroll a student in the course and select the student to enroll. (**Not available when course is closed**).
      * Click on Create Course to create a new course.

### Instructor Workflow
  - Edit your details
    + Click on 'Edit Details' button.
    + Make changes and click on 'Update Instructor' button.
  - Delete Account
    + Click on 'Delete Account' button from home page.
  - Courses
    + Click on Show Courses to view all courses.
      * Click on Show to view course details.
      * Click on Show and then click on respective option to update/delete the course.
      * Click on Enrolled Students to view all students enrolled in the course. You can drop a student from the course from here.
      * Click on Waitlisted Students to view all students waitlisted in the course. You can drop a student from the course from here.
      * Click on Enroll Student to enroll a student in the course and select the student to enroll. (**Not available when course is closed**).
      * Click on Create Course to create a new course.

### Student Workflow
  - Edit your details
    + Click on 'Edit Details' button.
    + Make changes and click on 'Update Student' button.
  - Delete Account
    + Click on 'Delete Account' button from home page.
  - Courses
    + Click on 'Courses' to list all courses. 
      * Courses in the top are the courses you are not enrolled to. 
      * Courses in the bottom are enrolled courses.
      * Click on Show to view course details.
      * Click on Enroll to enroll to a course. Based on the Availability, you will be enrolled or waitlisted.
      * Click on Drop to drop from a course.
    
## Edge Case Scenarios
  - Course is deleted
    + All the enrollments for this course will be removed.
  - Student is deleted
    + All the enrollments for the student will be removed.
    + If this student is enrolled in a course, the first student in the waitlist will be enrolled to this course.
  - Instructor is deleted
    + All instructor's courses will be removed.
    + All the enrollments for these courses will be removed.
  

## Installation Instructions

### Install Ruby and Rails
  - [Installation Instructions](https://guides.rubyonrails.org/v5.1/getting_started.html)

### Postgres setup

execute the following commands (for macos)
```
brew install postgres
psql postgres #this will get u inside psql
create database ses_app;
create role ses_user superuser login;
```

### Setup App

From the project root directory execute the following commands

```
bundle
rails db:migrate
rails db:seed # if u need seeded data
```

### Run App

Execute 'rails s' to start the application.
The application can be accessed from localhost:3000

## Deployment Instructions

  - Create a account in [Heroku](https://signup.heroku.com/login)
  - Install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
  - From the project root directory run the following commands
    ```
    bundle
    heroku create
    git push heroku main # git push heroku <branch_name>:main => if you want to push a different branch to heroku main
    heroku run rake db:migrate
    heroku run rake db:seed
    ```

## Team Members

  - Ashok Kumar Selvam - aselvam
  - Rachana Kondabala - rkondab
  - Vishal Veera Reddy - vveerar2



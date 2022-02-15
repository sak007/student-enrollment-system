# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clean data before seeding
Enrollment.delete_all
Course.delete_all
Instructor.delete_all
Student.delete_all
Admin.delete_all
User.delete_all

# Admin user
User.create(email: 'admin@ses.com', role: 'ADMIN', password_digest: BCrypt::Password.create('admin'))
Admin.create(name: 'Admin', user_email: 'admin@ses.com', phone: 9191919191, password_digest: BCrypt::Password.create('admin'))

# Instructors
User.create(email: 'ron@ses.com', role: 'INSTRUCTOR', password_digest: BCrypt::Password.create('instructor'))
Instructor.create(name: 'Ron Swanson', user_email: 'ron@ses.com', password_digest: BCrypt::Password.create('instructor'), department: 'PNR')

User.create(email: 'leslie@ses.com', role: 'INSTRUCTOR', password_digest: BCrypt::Password.create('instructor'))
Instructor.create(name: 'Leslie Knope', user_email: 'leslie@ses.com', password_digest: BCrypt::Password.create('instructor'), department: 'PNR')

User.create(email: 'chris@ses.com', role: 'INSTRUCTOR', password_digest: BCrypt::Password.create('instructor'))
Instructor.create(name: 'Chris Pratt', user_email: 'chris@ses.com', password_digest: BCrypt::Password.create('instructor'), department: 'PNR')

User.create(email: 'ben@ses.com', role: 'INSTRUCTOR', password_digest: BCrypt::Password.create('instructor'))
Instructor.create(name: 'Ben Wyatt', user_email: 'ben@ses.com', password_digest: BCrypt::Password.create('instructor'), department: 'PNR')

# Students
User.create(email: 'tom@ses.com', role: 'STUDENT', password_digest: BCrypt::Password.create('student'))
Student.create(name: 'Tom Haverford', password_digest: BCrypt::Password.create('student'), dob: '1990-12-01',
               user_email: 'tom@ses.com', phone: 9876543210, major: 'PNR')

User.create(email: 'andy@ses.com', role: 'STUDENT', password_digest: BCrypt::Password.create('student'))
Student.create(name: 'Andy Dwyer', password_digest: BCrypt::Password.create('student'), dob: '1991-11-02',
               user_email: 'andy@ses.com', phone: 9876543211, major: 'PNR')

User.create(email: 'april@ses.com', role: 'STUDENT', password_digest: BCrypt::Password.create('student'))
Student.create(name: 'April Ludgate', password_digest: BCrypt::Password.create('student'), dob: '1992-10-03',
               user_email: 'april@ses.com', phone: 9876543212, major: 'PNR')

User.create(email: 'donna@ses.com', role: 'STUDENT', password_digest: BCrypt::Password.create('student'))
Student.create(name: 'Donna Meagle', password_digest: BCrypt::Password.create('student'), dob: '1993-09-04',
               user_email: 'donna@ses.com', phone: 9876543213, major: 'PNR')

User.create(email: 'garry@ses.com', role: 'STUDENT', password_digest: BCrypt::Password.create('student'))
Student.create(name: 'Garry Gergich', password_digest: BCrypt::Password.create('student'), dob: '1994-08-05',
               user_email: 'garry@ses.com', phone: 9876543214, major: 'PNR')

User.create(email: 'ann@ses.com', role: 'STUDENT', password_digest: BCrypt::Password.create('student'))
Student.create(name: 'Ann Perkins', password_digest: BCrypt::Password.create('student'), dob: '1995-07-06',
               user_email: 'ann@ses.com', phone: 9876543215, major: 'PNR')

User.create(email: 'craig@ses.com', role: 'STUDENT', password_digest: BCrypt::Password.create('student'))
Student.create(name: 'Craig Middlebrooks', password_digest: BCrypt::Password.create('student'), dob: '1994-06-07',
               user_email: 'craig@ses.com', phone: 9876543216, major: 'PNR')

# Courses
Course.create(name: 'Time Management', description: 'Time Management', weekday1: 'MON', weekday2: 'WED',
              starttime: '11:45', endtime: '13:00', code: 'MAN121', capacity: 2, wlcapacity: 1, status: 'OPEN',
              room: 'R101', instructor_id: Instructor.find_by_user_email('leslie@ses.com').id)

# Course.create(name: '', description: '', weekday1: '', weekday2: '',
#               starttime: '', endtime: '', code: 'PNR', capacity: 2, wlcapacity: 1, status: 'OPEN',
#               room: 'R', instructor_id: Instructor.find_by_user_email('leslie@ses.com').id)

Course.create(name: 'Hunting', description: 'Hunting', weekday1: 'MON', weekday2: 'WED',
              starttime: '11:00', endtime: '12:00', code: 'REC101', capacity: 2, wlcapacity: 1, status: 'OPEN',
              room: 'The Forest', instructor_id: Instructor.find_by_user_email('ron@ses.com').id)

Course.create(name: 'Fishing', description: 'Fishing', weekday1: 'TUE', weekday2: 'THU',
              starttime: '8:30', endtime: '9:45', code: 'REC102', capacity: 2, wlcapacity: 1, status: 'OPEN',
              room: 'The Lake', instructor_id: Instructor.find_by_user_email('ron@ses.com').id)

Course.create(name: 'Management Basics', description: 'Management Basics', weekday1: 'TUE', weekday2: 'THU',
              starttime: '8:00', endtime: '9:15', code: 'MAN101', capacity: 2, wlcapacity: 1, status: 'OPEN',
              room: 'R102',  instructor_id: Instructor.find_by_user_email('chris@ses.com').id)

Course.create(name: 'Anger Management', description: 'Anger Management', weekday1: 'MON', weekday2: 'WED',
              starttime: '8:00', endtime: '9:15', code: 'PYC121', capacity: 2, wlcapacity: 1, status: 'OPEN',
              room: 'R104', instructor_id: Instructor.find_by_user_email('chris@ses.com').id)

Course.create(name: 'Politics', description: 'Politics', weekday1: 'FRI',
              starttime: '3:00', endtime: '5:00', code: 'POL101', capacity: 3, wlcapacity: 1, status: 'OPEN',
              room: 'R103', instructor_id: Instructor.find_by_user_email('ben@ses.com').id)


# Enrollments
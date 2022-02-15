# Student Enrollment System
## Team_2675

## Content

| S.No | Title | Hyperlink |
| - | - | - |
| 1 | Deployment Information | [Click here](#deployment-information) |
| 2 | Credentials | [Click here](#credentials) |
| 3 | Installation Instructions | [Click here](#installation-instructions) |
| 4 | Deployment Instructions | [Click here](#deployment-instructions) |
| 5 | Team Members | [Click here](#team-members) |


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


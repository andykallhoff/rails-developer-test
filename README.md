# About
- Ruby 2.3.3
- Rails 5.1.6
- Database: SQLite3

## Setting Up
- *get the repo, cd into that directory*
- `bundle`
- `rake db:create`
- `rake db:migrate`
- `rake db:seed`
- `rails s`
- *seed data logins*
- login emails: `guest@test.com` `editor@test.com` `admin@test.com`
- login password: `thisisapass`

### Notes
Sorry it took so long, couldn't work over the weekend to complete it as something came up.

I did not add a `categories` table because in the description it only listed and `articles` table, although I think ideally categories would be its own table. Also I wasn't sure how much "styling" you would be looking for, so I just made it presentable, nothing special by any means.

-------

# Simple News App - Rails Competency Test
To get started please fork this project and carefully read the following instructions.

Commit all of the code to your fork of this project. If you screen record yourself working through the competency test you'll get *(Extra Credit)*

## User Personas
The project will have multiple roles that interact with each other.
* Guest (No Login)
* Vanilla Users (Logged in - No special role)
* Editor Users
* Admin Users *(Extra Credit)*

## User Functionality
##### Guests (No Login)
* Can see homepage with first 3 articles from each category.
* Can see article index page.
* Are sent to signup page if they want to see article show page.
* Can signup
* Can Login

##### Vanilla Users
* Can see everything a guest can
* Can see article show pages. 
* Can logout

##### Editor Users
* Can do everything a vanilla User can.
* Can create articles
* Can delete articles that they created
* Can edit articles that they created

##### Admin User *(Extra Credit)*
* Can create users and set roles.
* Can edit users and change roles.
* Can't edit/destroy/create articles.

## Article Table
Table will contain **title**, **content**, **category**, **user_id**.

## Roles
Use one of these gems: Petergate *(Preferred)*, Pundit, Cancancan.
###### Role Names
* user
* editor
* admin *(Extra Credit)*

## Database
Use sqlite

## Testing
Use minitest as the test suite. 

## Authentication
Devise can be used for authentication.

## Templating
slim *(Prefered)*, haml, erb

# Paganel cars

The web application with car advertisements. A user with "admin" status can add, edit or delete advertisements. The Admin can also view application statistics. Users can view a list of all cars, sort them by price or date of addition (asc or desc). Users can also find cars based on specified criteria. Users can register to view their search history.

## Description
Task is implemented on **Ruby 3.2.0**

**Ruby on Rails 7.0.4.2**

Language: English

Used gem for authorization and authentication: **Devise**, **Pundit**

Load configuration variables into ENV in development: gem **Dotenv**

Database: **PostgreSQL*

### To Start
1. Clone this repository
```
git clone git@github.com:yuliatokaryk/paganel-cars.git
```
2. Create ".env" file, copy data from ".env.example" and paste it to ".env".

3. Install all necessary gems
```
bundle
```
4. Create database and migrations
```
rails db:create
rails db:migrate
```
5. Seed database
```
rails db:seed
```
6. Run app on localhost
```
bin/dev
```

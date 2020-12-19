# B@CKLG

## DESCRIPTION
- B@cklg is a video game cataloging application that allows users to create a list of, write reviews for, and rate video games.  
- This Ruby on Rails application is our final project for Phase (Mod) 2 of Flatiron School's Software Engineering Bootcamp. 
- It calls on and is heavily dependent on the RAWG video game API. 
- As a school project, the application is solely meant to demonstrate our RoR skills and is not monetized in anyway.

## SET UP 
1. run `bundle install` to install all gems/dependencies
2. request an API key from RAWG (instructions here: https://rawg.io/apidocs)
3. set your key to a variable called `rawg_key` in application.yml
    -example: `rawg_key: "your_key_here"`
4. run the migration files with `rails db:migrate`
5. run a server (using the terminal command `rails s`) to demo the app and view via local host in your browser

## MODELS
There are 5 models in the application; combined, they demonstrate usage of each of the 7 standard CRUD actions:
  - Game: has many Reviews and GameSystems; Users through Reviews and has many Systems through GameSystems
  - User: has many Reviews and Systems; has many Games through Reviews
  - System: has many SystemUsers and GameSystems; has many Users through SystemUsers and many Games through GameSystems
  - GameSystem: belongs to Game and System
  - SystemUser: belongs to System and User

## STYLING
- This app utilizes bootstrap and CSS

## CREATORS
- Reid Watson
- Sisan Agbeyegbe
- Billy Ott

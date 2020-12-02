# gfn-library
## If the lack of a Nvidia Geforce Now Games list bug syou as well then this is the app for you.

Nothing fancy just a curated list of all the games GFN has to offer, created using their own static api so you can always count on it to be up to date.
Browse through the list or search for a game you like to see if its there. List is updated with new games and info every Thursday pulling 12:00 PM.
This is a fully open sourced project so feel free to contribute and suggest new features!

## Setup: 
1. Install rails
2. Install postgresql
3. Clone repo
4. `cd` into repo directory
5. Set up postgresql
6. Run `bundle install` 

## Get list of games locally:
After ensuring database is set up, in the app directory run `rake games:create_files`.
This command will tap into GFN api and create local db records for all the games from gfn.
Geforce Now's list is updated every Thursday, so to stay update you may run that rake command again.
The `whenever gem` is set up however to update this list in the app every Thursday at 12:00pm and 12:00am should your app be running.

Sometimes there may be changes or updates made to the records themselves by Nvidia, at which case you may run `rake games:update_files` to keep
the records up to date. (This is also set to run every Thursday)



## Coming Soon:

Sorting (Category, Store, etc...)
About Project
Links to store to purchase games
Link to forum posts
Link to error/bug/request form for GFN


 


# Micro-blogging App (Reallien)

Collaborate web-design project for NYCDA.

Collaborators:
* https://github.com/jbedette
* https://github.com/dwolf1
* https://github.com/Smoreley

# Tech
* Sinatra
* ActiveRecords

Premise: A twitter-esk website where users predominantly post about alien sightings or occurrences.


# Boiled down sight ideas
During the design proccess we came up with a whole bunch of ideas on what we wanted the site to be. In the end we settled on two ideas, one an "Alien sighting" blog, and a "cupcake vs muffin" blog. We went with the former of our absurd ideas but I do hope one day we will come back and realize the latter.

Settlying on a thematic overview of the blog came the hardest part, the name. I wont bore you with the details but in the end we decided Reallien was the name we would go with. Though AlienRWithus was a close second.

# Quick nav map of how a user will progress through the site
home 	-> signup
	-> signin
		-> Dashboard (therePosts) -> account
		-> Home (everyones Post)
		-> logout

# Data markup 
Here we sketched out what data was going to be saved in that databse and then what data each page was going to use from the database.
User Table: username, fName, lName, Email, dob, Bio, LastActive, JoinDate, password,
Post Table: userID, DateOfPost, PostText,

Profile Page: Picture, Bio, posts, lastactive.


CHECKLIST
- SESSION THINGS
- PROFILE DISPLAY FROM DB
	- SEE OTHER PROFILES
- LOGOUT 
- DELETE
- POSTING
- UPDATE PICTURE

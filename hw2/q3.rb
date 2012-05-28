# 3. deploy & enhance RottenPotatoes
#
# a) Add some movies to RottenPotatoes, and deploy it to the world (sort of)
# We have a version of RottenPotatoes that has had some slight modifications for successful 
# deployment on Heroku, and to which we've added a handful more movies to make things interesting.
# Check it out to your VM by doing:
# git clone git://github.com/saasbook/hw2_rottenpotatoes.git
# cd hw2_rottenpotatoes
# You may have to install gems with bundle install --without production to ignore the PostgreSQL 
# gem for your local installation. Verify that you can successfully run it using rails server and 
# interact with it via a Web browser, as described in the book and in lecture.
#
# Note that we provided a migration that adds a bunch more movies to the database. Take a look at 
# the code in db/migrate/ to review how these work.
# 
# Once the above is working on your development computer, it's time to deploy. (Appendix
# A in the textbook has more information about this procedure.) Create a free Heroku.com account 
# if you haven't already, and deploy RottenPotatoes there. (Note that your app's name, 
# something.herokuapp.com, must be unique among Heroku apps; therefore it's unlikely that the name 
# "rottenpotatoes" will be available, so you can either choose a different name or just keep the 
# default name Heroku chooses for you whenever you create a new app.)
#
# Since this is the first deployment of this app on Heroku, its database will be empty. To fix 
# this, after you've pushed your app to Heroku, run 
#    heroku rake db:migrate 
# to apply all RottenPotatoes migrations--the initial one that creates the Movies table (which had
# already been applied when you got your VM) and the one we provided above that adds more movies.
#
# Visit your site at something.herokuapp.com/movies to verify that it’s working.
#
# b) RottenPotatoes enhancement #1: Sorting the list of all movies.
# Enhance RP in the following way:
#    On the list of all movies page, the column headings for 'title' and 'release date' for
#    a movie should be clickable links. Clicking one of them should cause the list to
#    be reloaded but sorted in ascending order on that column. For example, clicking
#    the 'release date' column heading should redisplay the list of movies with the earliest- 
#    released movies first; clicking the 'title' field should list the movies alphabetically by 
#    title. (For movies whose names begin with non-letters, the sort order should match the 
#    behavior of String#<=>.)
#
# The link (that is, the <a> tag) for sorting by ‘title’ should have the HTML element id title_header.
# The link for sorting by ‘release date’ should have the HTML element id release_date_header.
# The table containing the list of movies should have the HTML element id movies
# (this has already been set for you by existing code).
# When the listing page is redisplayed with sorting-on-a-column enabled, the column header that was 
# selected for sorting should appear with a yellow background, as shown below. You should do this 
# by setting controller variables that are used to conditionally set the CSS class of the 
# appropriate table heading to hilite, and pasting this simple CSS into RottenPotatoes' 
# app/assets/stylesheets/application.css file.
#
# Here are some hints and caveats as you do this part:
#
# The current RottenPotatoes views use the Rails-provided "resourceful routes" helper movies_path 
# to generate the correct URI for the movies index page. You may find it helpful to know that if 
# you pass this helper method a hash of additional parameters, those parameters will be parsed by 
# Rails and available in the params[] hash. Databases are pretty good at returning collections of 
# rows in sorted order according to one or more attributes. Before you rush to sort the collection 
# returned from the database, look at the documentation for the ActiveRecord find and all methods 
# and see if you can get the database to do the work for you.
#
# Don't put code in your views! The view shouldn't have to sort the collection itself—its job is 
# just to show stuff. The controller should spoon-feed the view exactly what is to be displayed.

def palindrome?(string)
   s = string.downcase.gsub(/\W/, "")
   return (s == s.reverse)
end

if __FILE__ == $0
   string = "A man, a plan, a canal -- Panama"
   puts string
   puts palindrome?(string) 
   #=> true 

   string = "Madam, I'm Adam!"
   puts string
   puts palindrome?(string) 
   # => true 

   string = "Abracadabra"
   puts string
   puts palindrome?(string) 
   # => false (nil is also ok)
end

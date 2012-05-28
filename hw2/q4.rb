# 4. RottenPotatoes enhancement #2: filter the list of movies
#
# Enhance RottenPotatoes as follows. At the top of the All Movies listing, add some checkboxes that 
# allow the user to filter the list to show only movies with certain MPAA ratings:
#
# When the Refresh button is pressed, the list of movies is redisplayed showing only those movies 
# whose ratings were checked.
#
# This will require a couple of pieces of code. We have provided the code that generates the 
# checkboxes form, which you can include in the index.html.haml template, here on Pastebin. BUT, 
# you have to do a bit of work to use it: our code expects the variable @all_ratings to be an 
# enumerable collection of all possible values of a movie rating, such as ['G','PG','PG- 13','R']. 
# The controller method needs to set up this variable. And since the possible values of movie 
# ratings are really the responsibility of the Movie model, it's best if the controller sets this 
# variable by consulting the Model. Create a class method of Movie that returns an appropriate 
# value for this collection.
# 
# You will also need code that figures out (i) how to figure out which boxes the user checked 
# and (ii) how to restrict the database query based on that result.
#
# Regarding (i), try viewing the source of the movie listings with the checkbox form, and you'll 
# see that the checkboxes have field names like ratings[G], ratings[PG], etc. This trick will 
# cause Rails to aggregate the values into a single hash called ratings, whose keys will be the 
# names of the checked boxes only and whose values will be the value attribute of the checkbox 
# (which is "1" by default, since we didn't specify another value when calling the check_box_tag 
# helper). That is, if the user checks the 'G' and 'R' boxes, params will include as one if its 
# values :ratings=>{"G"=>"1", "R"=>"1"} . Check out the Hash documentation for an easy way to grab 
# just the keys of a hash, since we don't care about the values in this case.
#
# Regarding (ii), you'll probably end up replacing Movie.all with Movie.find, which has various 
# options to help you restrict the database query.
#
# Two caveats:
#
# Make sure that you don't break the sorted-column functionality you added in part 3b! That is, 
# sorting by column headers should still work, and if the user then clicks the "Movie Title" column 
# header to sort by movie title, the displayed results should both be sorted and be limited by the 
# Ratings checkboxes.
#
# If the user checks (say) 'G' and 'PG' and then redisplays the list, the checkboxes that were 
# used to filter the output should appear checked when the list is redisplayed. This will require 
# you to modify the checkbox form slightly from the version we provided above. Don't put code in 
# your views! Set up some kind of instance variable in the controller that remembers which ratings 
# were actually used to do the filtering, and make that variable available to the view so that the 
# appropriate boxes can be pre-checked when the index view is reloaded.
#
# Update: Make sure that your form elements have the following ids. The submit button for filtering 
# by ratings should have an HTML element id of ratings_submit. Each checkbox should have an HTML 
# element id of ratings_#{rating}, where the interpolated rating should be the rating itself, such 
# as “PG-13”, “G”. An example of an id for the checkbox for PG-13 is ratings_PG-13.

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

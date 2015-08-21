def generate_resources
  puts "generating resources..."
  Resource.create!([
    {
     name: "Pragmatic Studios",
     description: "Series of online videos and guided tutorials for learning both Ruby and Rails", 
     link: "https://pragmaticstudio.com" 
    },
    {
     name: "Schema Design",
     description: "Allows for visual represenation of database relationships.",
     link: "http://ondras.zarovi.cz/sql/demo/"
    },
    {
     name: "SQL Course",
     description: "Learn SQL with a series of basic exercises.",
     link: "http://sqlcourse.com"
    },
    {
     name: "Vic Ramon's Ember Tutorial",
     description: "Online tutorial for learning the Ember framework",
     link: "http://ember.vicramon.com"
    },
    {
     name: "Sitepoint - How to use jQuery's $.ajax() function",
     description: "Online tutorial that provides detailed steps to use $.ajax() function",
     link: "http://www.sitepoint.com/use-jquerys-ajax-function"
    }
  ])
  puts "resources complete."
end

def generate_keywords
  puts "generating keywords..."
  words = %w(Rails Ruby JavaScript jQuery Ember HTML CSS RSpec AJAX Testing)
  words.each do |word|
    Keyword.create(name: word)
    puts "Keyword: #{word}"
  end
  puts "keywords complete."
end

generate_resources
generate_keywords

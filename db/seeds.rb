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
     link: "http://http://www.sitepoint.com/use-jquerys-ajax-function"
    }
  ])
  puts "resources complete."
end

def generate_users
  puts "generating users..."
  User.create!([
    {
     name: "admin",
     email: "admin@example.com",
     password: "password",
     password_confirmation: "password",
     admin: true
    },
    {
     name: "User1",
     email: "user1@example.com",
     password: "password",
     password_confirmation: "password"
    },
    {
     name: "User2",
     email: "user2@example.com",
     password: "password",
     password_confirmation: "password"
    },
    {
     name: "User3",
     email: "user3@example.com",
     password: "password",
     password_confirmation: "password"
    }])
  puts "users complete."
end

def comments
  ['The best resource ever!', 'Waste of time', 'I learned so much from this resource', 'Really challenging, but worth the effort']
end

def generate_reviews
  puts "generating reviews..."
    Resource.all.each do |resource|
      User.all.each do |user|
        Review.create!(resource: resource, user: user, comment: comments[rand(3)], rating: rand(0..5))
      end
    end
  puts "reviews complete."
end

generate_resources
generate_users
generate_reviews

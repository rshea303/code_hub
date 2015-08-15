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
    }
  ])
  puts "resources complete."
end

def generate_users
  puts "generating users..."
  User.create!([
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

generate_resources
generate_users

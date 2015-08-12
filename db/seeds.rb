def generate_resources
  puts "generating resources..."
  Resource.create!([
    {
     name: "Pragmatic Studios",
     link: "https://pragmaticstudio.com", 
     rating: 5
    },
    {
     name: "Schema Design",
     link: "http://ondras.zarovi.cz/sql/demo/",
     rating: 3
    },
    {
     name: "SQL Course",
     link: "http://sqlcourse.com",
     rating: 1
    }
  ])
  puts "resources complete."
end

generate_resources

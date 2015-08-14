def generate_resources
  puts "generating resources..."
  Resource.create!([
    {
     name: "Pragmatic Studios",
     link: "https://pragmaticstudio.com", 
    },
    {
     name: "Schema Design",
     link: "http://ondras.zarovi.cz/sql/demo/",
    },
    {
     name: "SQL Course",
     link: "http://sqlcourse.com",
    }
  ])
  puts "resources complete."
end

generate_resources

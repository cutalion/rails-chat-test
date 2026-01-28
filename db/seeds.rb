# Create admin
Administrator.find_or_create_by!(nickname: "admin")
puts "Created admin: admin"

# Create users
%w[alice bob charlie diana eve].each do |nickname|
  User.find_or_create_by!(nickname: nickname)
  puts "Created user: #{nickname}"
end

puts "\nSeed data created successfully!"
puts "Admin: admin"
puts "Users: alice, bob, charlie, diana, eve"

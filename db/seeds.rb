User.destroy_all

5.times do |i|
  User.create!(
    email: "user#{i}@yopmail.com",
    password: "azerty123",
    password_confirmation: "azerty123",
    first_name: "Jean#{i}",
    last_name: "Martin#{i}",
    description: "Utilisateur de test numéro #{i}"
  )
end

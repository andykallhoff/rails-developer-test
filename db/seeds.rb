#--- Users
User.destroy_all
roles = %w(guest vanilla editor admin)
roles.each do |role|
  User.create(email: "#{role}@test.com", password: "thisisapass", password_confirmation: "thisisapass", role: role)
end

#--- Articles
#Article.destroy_all

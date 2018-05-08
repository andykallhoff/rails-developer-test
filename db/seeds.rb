#--- Users
User.destroy_all
roles = %w(guest editor admin)
roles.each do |role|
  User.create(email: "#{role}@test.com", password: "thisisapass", password_confirmation: "thisisapass", role: role)
end
puts "#{User.count} Users created"

#--- Articles
Article.destroy_all
categories = %w(curious funny serious other)
text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
editor = User.where(role: 'editor').first
categories.each do |c|
  9.times{|i| Article.create(title: "#{c} - #{i}", category: c, content: text * i, user: editor)}
end
puts "#{Article.count} Articles created"

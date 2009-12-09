# seeds.rb
#
# Seed the database with valuable data.

User.new do |u|
	u.login = 'admin'
	u.email = 'admin@evereeve.org'
	u.password = 'admin'
	u.password_confirmation = 'admin'
	u.save!
end

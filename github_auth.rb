system("gem install github_api")
require 'github_api'
require 'io/console'

# Bypass annoying deprecation warning between the
# github_api gem and the faraday gem
Faraday::Builder = Faraday::RackBuilder

print "Github Username: "
user_name = gets.strip
print "Github Password (nothing will be displayed):"
password  = STDIN.noecho(&:gets).strip
github = Github.new(:login => user_name, :password => password)
github.users.keys.create("title" => "Bootcamp", 
	"key"=> File.open(ENV['HOME']+"/.ssh/id_rsa.pub").read)
puts "\nok!"

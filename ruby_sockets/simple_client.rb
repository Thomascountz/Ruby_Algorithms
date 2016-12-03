require 'socket'
require 'pry'
require 'json'

#Client 

def request(verb, post_hash = {})
  host = 'localhost'
  port = 2000
  path = '/index.html'
  verb = verb
  post_hash = post_hash
  
  server = TCPSocket.new(host, port) #identifier of network interface and port number
  
  req = "#{verb} #{path} HTTP/1.0\nHost: #{host}\nContent-length: #{post_hash.size}\n\n#{post_hash}\r\n\r\n"
  server.print req
  
  response = server.read
  
  # while line = server.gets #while 'gets' returns anything except 'nil'
  #   response << line.chop #puts the line and removes the last character, in this case: \r\n 
  # end
  
  
  puts response
end

puts "Would you like to send a GET or POST request?"
input = gets.chomp.upcase

if input == "GET"
  request("GET")
elsif input == "POST"
  print "Name: "
  name = gets.chomp
  print "Email: "
  email = gets.chomp
  request_hash = {:viking => {:name => name, :email => email}}
  json_hash = request_hash.to_json
  request("POST", json_hash)
end


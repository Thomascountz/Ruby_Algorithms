
require 'socket'

host = 'localhost'
port = 2000
path = '/index.html'

r = "POST #{path} HTTP/1.0\nHost: #{host}\r\n\r\n" #formatted http request

socket = TCPSocket.open(host, port)
socket.print r
response = socket.read


headers, body = response.split("\r\n\r\n", 2) 
puts headers
puts "\n"
puts body

# #http/net client

# require 'net/http'                  # The library we need
# host = 'www.rubyinside.com'     # The web server
# path = '/test.txt'                 # The file we want 

# http = Net::HTTP.new(host)          # Create a connection
# headers, body = http.get(path).header, http.get(path).body # Request the file
# if headers.code == "200"            # Check the status code   
#   print body                        
# else                                
#   puts "#{headers.code} #{headers.message}" 
# end
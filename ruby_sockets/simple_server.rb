require 'socket'
require 'pry'
require 'json'

#Server


def request_parser(req)
  parsed = req.scan(/\S+/)
  verb = parsed[0]
  resource = parsed[1]
  host = parsed[4]
  version = parsed[2]
  body = parsed[7]
  
  {:verb => verb, :resource => resource, :version => version, :host => host, :body => body}
end

def get_headers(request)
  
  headers = Array.new
  headers << "#{request[:version]} #{get_code(request)}"
  headers << "Date: #{Time.now.strftime("%a, %d %b %G %H:%M:%S")} GMT"
  headers << "Content-Type: text/html"
  headers << "Content-length: #{get_body(request).size}"
  headers
end

def get_code(request)
  
  verb = request[:verb]
  path = request[:resource][1..-1]
  
  case verb
    when "GET" 
      return File.exists?(path) ? "200 OK" : "404 Not Found"
    when "POST" 
      return File.exists?(path) ? "200 OK" : "404 Not Found"
    when "DELETE"
      return "200 OK"
    when "HEAD" 
      return "200 OK"
    else 
      return "400 Bad Request"
  end

end

def get_body(request)
  
  path = request[:resource][1..-1]
  
  if File.exists?(path)
    if request[:verb] == "GET"
      body = get_resource(path)
    elsif request[:verb] == "POST"
      if !request[:body].nil?
        body = get_resource('thanks.html', new_line(request))
      else
        body = get_resource(path)
      end
    end
  else
    body = get_resource('404error.html') 
  end
  body.join
end


def get_resource(resource, new_line = "")
  f = File.open(resource)
  body = f.readlines
  f.close
  
  body.map! do |line|
    if line.include?("<%= yield %>")
      line.gsub!("<%= yield %>", new_line)
    else
      line = line
    end
  end
  
  return body
end


def new_line(request)
  
  newline = "<li>"
  newline << "Name: "
  newline << JSON.parse(request[:body])["viking"]["name"]
  newline << "</li>"
  newline << "\n"
  newline << "\t<li>"
  newline << "Email: "
  newline << JSON.parse(request[:body])["viking"]["email"]
  newline << "/li>"
  newline

end

server = TCPServer.open(2000) #socket to listen on port 2000

loop { #this server will listen forever
  
  client = server.accept #waits for a client to connect
  
  req = client.gets("\r\n\r\n")
  parsed_request = request_parser(req)
  
  response = get_headers(parsed_request).join("\n") 
  response << "\r\n\r\n" 
  response << get_body(parsed_request)

  
  client.print response.to_s
  puts Time.now
  puts "Connected to client."
  client.close #closes connection
  
}
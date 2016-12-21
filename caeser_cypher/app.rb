require 'sinatra'
require 'sinatra/reloader'
require './lib/caeser_cypher.rb'

get '/' do
  "Hello, World"
end
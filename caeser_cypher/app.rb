require 'sinatra'
require 'sinatra/reloader'
require './lib/caeser_cypher.rb'

get '/' do
  params[:input_string] ? string = params[:input_string] : string = "Encrypted Message"
  params[:shift_value]  ? index = params[:shift_value].to_i : index = 0
  message = c_cypher(string: string, index: index)
  erb :index, locals: { message: message }
end
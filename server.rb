require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/json'

configure :development, :test do
  require 'byebug'
end

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  redirect '/books'
end

get '/books' do
  erb :index
end

get '/books.json' do
  books = Book.all

  json({
    books: books
    })
end

post '/books' do
  Book.create(title: params["title"],
              author: params["author"],
              completed: params["completed"],
              fiction: params["fiction"],
              mystery: params["mystery"]).to_json
end

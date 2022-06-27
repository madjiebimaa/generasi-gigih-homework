require 'sinatra'
require_relative 'config'

get '/' do
  'This is the home page. You will see this if you don\'t specify any specific route.'
end

get '/messages' do
  erb :message, locals: {
    name: 'GenerasiGIGIH',
    color: 'DodgerBlue'
  }
end

get '/messages/:name' do
  name = params['name']
  color = params['color'] ? params['color'] : 'DodgerBlue'
  erb :message, locals: {
    name: name,
    color: color
  }
end

get '/login' do
  erb :login
end

post '/login' do
  if params['username'] == 'admin' && params['password'] == 'admin'
    return 'Logged in!'
  else
    redirect '/login'
  end
end

get '/items/new' do
  erb :items_new
end

post '/items' do
  erb :item, locals: {
    name: params['name'],
    category: params['category'],
    price: params['price']
  }
end

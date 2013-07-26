enable :sessions

get '/' do
  if !user.nil?
    user = User.find(session[:id])
    if user.albums
      album = user.albums.first
      if !album.nil? && album.photos.length > 0
        @photos = album.photos
      end
    end
    erb :index
  else
    erb :index
  end
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.login(params)
  if user
    session[:id] = user.id
    session[:email] = user.email
  else
    content_type :json
    { user: false }.to_json
  end
end

post '/new_user' do
  user = User.create(params)
  user.albums.create(title: "My First Album")
  session[:id] = user.id
  session[:email] = user.email
end

get '/logout' do
  session.clear
  redirect '/'
end

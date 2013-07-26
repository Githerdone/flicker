post '/delete_album' do  
  Album.destroy(params[:id])
  redirect '/'
end

post '/add_album' do
  p params
  current_user.albums.create(params);
end
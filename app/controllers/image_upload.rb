post '/' do
  uploader = Upload.new
  uploader.store!(params[:filename])
  user = User.find(session[:id])
  album = user.albums.first
  album.photos.create(title: "new photo", file: params[:filename] )
  redirect '/'
end
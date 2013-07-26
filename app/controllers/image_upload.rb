post '/' do
  uploader = Upload.new
  uploader.store!(params[:filename])
  user = User.find(session[:id])
  album = user.albums.first
  p album
  @photo = album.photos.create(title: "new photo", file: params[:filename] )
  # uploader.retrieve_from_store!('test.jpg')
  p "here I am __________---------------------------------------"
  p user
  session[:image] = @photo.file
  @photos = album.photos
  p @photos
  erb :index

end
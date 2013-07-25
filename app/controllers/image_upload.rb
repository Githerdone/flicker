post '/' do
  p params[:filename]
  # file = File.open(paras[:filename][:filename])
  uploader = Upload.new
  uploader.store!(params[:filename])
end
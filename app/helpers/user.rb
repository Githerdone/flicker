helpers do
  
  def current_user
    session[:id]
  end

  def user
    session[:email]
  end

  def img(name)
    '<p>hello</p>'
    "<img src='#{name}' alt='#{name}' />"
  end

end
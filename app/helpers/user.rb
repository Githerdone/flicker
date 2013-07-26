helpers do
  

  def current_user
    User.find_by_id(session[:id])
  end

  def logged_in?
    !session[:id].nil?
  end

  def user
    session[:email]
  end

  def img(name)
    "<img src='#{name}' alt='#{name}' />"
  end
end
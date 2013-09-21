
def current_user
  @current_user ||= User.find_by_is(session[:id])
end


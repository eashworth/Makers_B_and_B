require_relative './../model/user'

class Login

  def self.check_login(username, password)
    User.first(:username => username, :password_digest => password)
  end
end



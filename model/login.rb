require_relative 'user'

class Login

  def self.test(username, password)
    User.first(:username => username, :password => password)
  end
end

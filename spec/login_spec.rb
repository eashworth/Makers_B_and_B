require 'login'

describe Login do
  describe '#check_login' do
    it 'receives an existing user and expects to return that user' do
      user = User.create(:name => 'unittestname1', :email => 'unitemail1', :username => 'unitusername1', :password => 'unitpassword')
      expect(Login.check_login(user.username, user.password)).to eq(user)
    end
    it "returns nil if the username or password don't exist in the same user object" do
      expect(Login.check_login('wronguser', 'wrongpassword')).to eq nil
    end
  end
end

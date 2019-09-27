require_relative './web_helpers'
feature 'register for an account' do
  scenario 'user registers a user name and password and is notified' do
    DataMapper.auto_migrate!
    register
    expect(page).to have_content 'name'
    expect(page).to have_content 'Registration successful!'
  end
  scenario 'user registers with an existing a username and is notified it is already in use' do
    DataMapper.auto_migrate!
    register
    register
    expect(page).to have_content 'Username already in use. Please choose another.'
  end
end

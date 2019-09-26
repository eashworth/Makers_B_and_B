require_relative './web_helpers'
feature 'register for an account' do
  scenario 'user registers a user name and password and is notified' do
    register
    expect(page).to have_content 'name'
    expect(page).to have_content 'Registration successful!'
  end
end

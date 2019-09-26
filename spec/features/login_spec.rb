feature 'login' do
  scenario 'previously registered user can log out then log in again' do
    register
    click_button 'logout'
    click_button 'login'
    fill_in 'username', with: 'JuneScott123'
    fill_in 'password', with: '123456'
    click_button 'submit'
    expect(page).to have_content "Thank you for logging in."
  end
end
# add tests for failed logins
# change placeholders
# add unit test for login

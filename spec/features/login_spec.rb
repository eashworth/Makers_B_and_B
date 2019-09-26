feature 'login' do
  scenario 'previously registered user can log out then log in again successfully' do
    register
    click_button 'logout'
    click_button 'login'
    fill_in 'username', with: 'JuneScott123'
    fill_in 'password', with: '123456'
    click_button 'submit'
    expect(page).to have_content "Thank you for logging in."
  end
  scenario 'previously unregistered user cannot log in successfully' do
    visit '/'
    click_button 'login'
    fill_in 'username', with: 'unregistered_user'
    fill_in 'password', with: 'unregistered_password'
    click_button 'submit'
    expect(page).to have_content "Login failed: incorrect username and/or password."
  end
end

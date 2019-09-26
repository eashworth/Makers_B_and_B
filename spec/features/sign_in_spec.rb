feature 'register for an account' do
  scenario 'user registers a user name and password and is notified' do
    visit '/'
    click_button 'register'
    fill_in 'name', with: 'name'
    fill_in 'email', with: 'email@email.com'
    fill_in 'username', with: 'JuneScott123'
    fill_in 'password', with: '123456'
    click_button 'submit'
    expect(page).to have_content 'name'
    expect(page).to have_content 'Registration successful'
  end
end

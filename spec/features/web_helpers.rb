def register
  visit '/'
  click_button 'register'
  fill_in 'name', with: 'name'
  fill_in 'email', with: 'email@email.com'
  fill_in 'username', with: 'JuneScott123'
  fill_in 'password', with: '123456'
  click_button 'submit'
end

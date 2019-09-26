feature 'making requests' do
  scenario 'user can request an space' do
    visit '/'
    fill_in 'name', with: 'testname11'
    fill_in 'email', with: 'testemail1'
    fill_in 'password', with: 'password'
    click_button 'submit'

    expect(current_path).to eq('/listings/all')

    fill_in 'date', with: '2019-09-29'
    click_button 'request'

    expect(page).to have_content 'request sent for 2019-09-29'
  end
end

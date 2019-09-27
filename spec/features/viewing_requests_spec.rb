feature 'viewing requests' do
  scenario 'owner can approve requests from other users' do
    visit '/'
    fill_in 'name', with: 'testname11'
    fill_in 'email', with: 'testemail1'
    fill_in 'password', with: 'password'
    click_button 'submit'

    expect(current_path).to eq('/listings/all')
    click_button 'Create space'
    expect(current_path).to eq('/listings/new')

    fill_in 'name', with: 'test_space1'
    fill_in 'description', with: 'description1'
    fill_in 'price_pn', with: 10
    fill_in 'date_from', with: '2019-09-29'
    fill_in 'date_to', with: '2019-09-30'
    click_button 'submit'

    expect(current_path).to eq('/listings/all')

    first('.space').fill_in 'date', with: '2019-09-29'
    first('.space').click_button 'request'
    expect(page).to have_content 'Request sent for 2019-09-29.'
    click_button 'Back'

    expect(current_path).to eq('/listings/all')

    click_button 'View bookings'
    expect(current_path).to eq('/bookings')
  end
end

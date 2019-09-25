feature 'view listings page' do
  scenario 'user sees a list of all spaces' do
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
    click_button 'submit'

    expect(current_path).to eq('/listings/all')
    expect(page).to have_content 'test_space1'
    expect(page).to have_content 'description1'
  end
end
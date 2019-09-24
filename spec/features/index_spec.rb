feature 'view database entry' do
  scenario 'user enters values and they are displayed' do
    visit '/'
    fill_in 'name', with: 'testname11'
    fill_in 'email', with: 'testemail1'
    click_button 'submit'
    expect(page).to have_content 'testname1'
    expect(page).to have_content 'testemail1'

    expect(page).not_to have_content 'testname3'
    expect(page).not_to have_content 'testemail3'
  end
end

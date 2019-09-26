require_relative './web_helpers'
feature 'user logout' do
  scenario 'user clicks button and is notified they have logged out' do
    register
    click_button 'Logout'
    expect(page).to have_content "You have logged out."
  end
end

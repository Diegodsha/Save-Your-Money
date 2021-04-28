# require 'capybara/rspec'

# RSpec.describe 'Sign in', type: :system do
#   before :each do
#     User.create(name: 'Diego', email: 'diego@hotmail.com')
#   end

#   it 'signs me in' do
#     visit '/login'

#     within('#new_session') do
#         fill_in 'Name', with: 'Diego'
#     end

#     sleep(3)
#     click_button 'Login'

#     sleep(3)
#    expect(page).to have_content 'You logged in succesfully as Diego'
#   end
# end

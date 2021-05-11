# require 'capybara/rspec'

# RSpec.describe 'Sign in', type: :system do
#   before :each do
#     User.create(name: 'Hello', email: 'hello@hotmail.com')
#   end

#   it 'signs me in' do
#     visit '/login'

#     within('#new_session') do
#       fill_in 'Name', with: 'Hello'
#     end

#     sleep(3)
#     click_button 'Login'

#     sleep(3)
#     expect(page).to have_content('You logged in succesfully as Hello')
#   end

#   describe 'New expense page' do
#     it 'shows an authentication warning' do
#       visit new_expense_path
#       sleep(3)

#       expect(page).to have_content('You need to login or sign up to access')
#     end
#   end
# end

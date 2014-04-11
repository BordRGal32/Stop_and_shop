require 'spec_helper'

feature 'Creating a new session' do
   scenario 'from the Login page you can sign in if you already have an account' do
   create_and_sign_in
   page.should have_content "Logged"
 end
 scenario 'from the login page you cannot sign in without the correct password' do
    user = FactoryGirl.create(:user)
    visit '/sessions/new'
    fill_in :username, :with => user.username
    fill_in :password, :with => 'not my password'
    click_button 'Log In'
    page.should have_content 'invalid'
  end
  scenario 'from the login page you cannot sign in without a valid username' do
    user = FactoryGirl.create(:user)
    visit '/sessions/new'
    fill_in :username, :with => 'not my username'
    fill_in :password, :with => user.password
    click_button 'Log In'
    page.should have_content 'invalid'
  end
end

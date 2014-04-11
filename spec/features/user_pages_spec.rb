require 'spec_helper'

feature 'Creating a new user' do
  scenario 'from a logged in users account create a new user' do
    create_and_sign_in

    visit new_user_path
    fill_in "Username", :with => "My Name"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_on "Create User"
    page.should have_content "Welcome"
  end
    scenario 'from a logged in users account you cannot create a user without a password' do
    create_and_sign_in
    visit new_user_path
    fill_in "Username", :with => "My Name"
    click_on "Create User"
    page.should have_content "can't be blank"
  end
    scenario 'from a logged in users account you cannot create a user without a username' do
    create_and_sign_in
    visit new_user_path
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_on "Create User"
    page.should have_content "can't be blank"
  end
    scenario 'from a logged in users account you cannot create a user without a password confirmation' do
    create_and_sign_in
    visit new_user_path
    fill_in "Username", :with => "My Name"
    fill_in "Password", :with => "password"
    click_on "Create User"
    page.should have_content "can't be blank"
  end
  scenario 'from a logged in users account you cannot create a user without a unique username' do
    create_and_sign_in
    visit new_user_path
    fill_in "Username", :with => @user.username
    fill_in "Password", :with => @user.password
    fill_in "Password confirmation", :with => @user.password
    click_on "Create User"
    page.should have_content 'already been taken'
  end
end

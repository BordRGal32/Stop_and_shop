def create_and_sign_in
  @user = FactoryGirl.create(:user)
  visit '/sessions/new'
  fill_in :username, :with => @user.username
  fill_in :password, :with => @user.password
  click_button 'Log In'
end

require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
test 'existing user can login' do
   login_user
   assert page.has_content?("Welcome, Clarence")
 end

 test 'guest cannot login' do
   visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login!"
    assert page.has_content?("Invalid Login")
 end

 test 'registered user cannot login with wrong password' do
   user = User.create(username: "Clarence", password: "password")
   visit login_path
   fill_in "Username", with: "Clarence"
   fill_in "Password", with: "wrongpassword"
   click_button "Login"

   assert page.has_content?("Invalid Login")
 end

 test 'authenticate user can log out' do
  login_user
    assert page.has_content?("Welcome, Clarence")
    click_link "Logout"

    assert page.has_content?("Goodbye!")

 end

 def login_user
   user = User.create(username: "Clarence", password: "password")
   visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login!"

 end
end

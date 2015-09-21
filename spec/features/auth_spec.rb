require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before :each  do
    visit ('/users/new')
  end

  it "has a new user page" do
    expect(page).to have_content("Sign Up")
  end

  it "renders error messages to user" do
    click_on 'Sign Up'
    expect(page).to have_content("Username can't be blank")
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  it "redirects to correct page after sign up" do
    user = build(:user)
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "Sign Up"
    expect(page).to have_content("Signed in as: #{user.username}")
  end
end

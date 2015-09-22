require 'spec_helper'
require 'rails_helper'
require 'byebug'

feature "user show page (goals page)" do
  before :each do
    user = create(:user)
    visit ("/users/#{user.id}")
    4.times {create(:goal, user_id: user.id)}
  end

  it "render page only for signed in users" do
    expect(page).to have_content('Sign In')
  end
end

feature "list goals to user" do
  let(:user) { create_and_sign_in_user }

  before :each do
    4.times { create(:goal, user_id: user.id) }
    visit user_url(user)
  end

  it "renders all completed goals" do
    user.completed_goals.each do |goal|
      expect(page).to have_content(goal.title)
    end
  end

  it "renders all incomplete goals" do
    user.incomplete_goals.each do |goal|
      expect(page).to have_content(goal.title)
    end
  end

  it "render navigation links for goals" do
    unless user.incomplete_goals.empty?
      click_on 'See more', :match => :first
      expect(page).to have_content(user.incomplete_goals.first.title)
    end
  end
end

feature "privacy permissions work on goals" do
  let(:user) {create_private_user}
  let(:guest) {create_and_sign_in_user}

  before :each do
    guest
    visit(user_url(user))
  end

  it "cannot click into private goals" do
    expect(page).to_not have_content('See more')
  end

  it "gets redirected if it tries to visit a private goal" do
    expect(page).to have_content("Here are the goals for #{user.username}")
  end
end

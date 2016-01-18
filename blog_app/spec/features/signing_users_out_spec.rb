require "rails_helper"

RSpec.feature "Users sign out" do
    
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    visit "/"
    
    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
  end

  scenario "signing out - after having signed in" do
    visit "/"
    click_button "Sign out" 
    expect(page).to have_content("Signed out successfully")
  end

end
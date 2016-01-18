require "rails_helper"

RSpec.feature "Users signup" do

  scenario "with valid user id password" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "pmlc@iinet.net.au"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up" 
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

end
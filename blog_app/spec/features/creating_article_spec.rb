require 'rails_helper'

RSpec.feature "Creating Articles" do
  scenario "User creates a new article" do
    visit "/"
    
    click_link "New Article"
    fill_in "Title", with: "Creating First Article"
    fill_in "Body", with: "Lorem ipsum"
    
    click_button "Create Article"
  
    expect(page).to have_content("Your article was created succesfully")
    expect(page.current_path).to eq(articles_path)
  end
end
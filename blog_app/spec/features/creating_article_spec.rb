require 'rails_helper'

RSpec.feature "Creating Articles" do

  before do
    john = User.create(email: "john@example.com", password: "password")
    login_as(john)
    @article = Article.create(title: "The first article", body: "Body of first article", user: john)
  end

  scenario "User creates a new article" do
    visit "/"

    click_link "New Article"
    fill_in "Title", with: "Creating First Article"
    fill_in "Body", with: "Lorem ipsum"
      
    click_button "Create Article"

    expect(page).to have_content("Your article was created succesfully")
    expect(page.current_path).to eq(articles_path)
    #expect(page).to have_content("Created by: #{@john.email}")
  end
  
  scenario "A user fails to create a new article" do
    visit "/"
    
    click_link "New Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Create Article" 
 
    expect(page).to have_content("2 errors prohibited this article from being saved")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
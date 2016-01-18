require "rails_helper"

RSpec.feature "Showing an Article" do
  
  before do 
    @josh = User.create(email: "josh@example.com", password: "password")
    @pierre = User.create(email: "pierre@example.com", password: "password")
    @article = Article.create(title: "The first article", body: "Body of first article", user: @josh)
  end
  
  scenario "A non-signed in user does not see Edit or Delete links" do
    visit "/"
    
    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
    
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
     
  end
  
  scenario "A non-owner signed in cannot see both links" do
    login_as(@pierre)
    
    visit "/"
    
    click_link @article.title
    
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end
  
  scenario "A signed in owner sees both links" do
    login_as(@josh)
    
    visit "/"
    
    click_link @article.title
    
    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
  end
  
  scenario "Display individual article" do
    visit "/"
    
    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end
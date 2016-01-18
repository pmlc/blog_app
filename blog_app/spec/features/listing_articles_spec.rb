require 'rails_helper'

RSpec.feature "Listing Articles" do

  before do
    john = User.create(email: "john@example.com", password: "password")
    login_as(john)
    @article1 = Article.create(title: "the first title", body: "body of first article", user: john)
    @article2 = Article.create(title: "the second title", body: "body of second article", user: john)
  end
  
  scenario "list all articles" do
    visit "/"
    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end
  
end


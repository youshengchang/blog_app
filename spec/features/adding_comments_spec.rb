require 'rails_helper'

RSpec.feature "Adding review to article" do
    
    before do
        
        @john = User.create(email: "john@example.com", password: "password")
        @fred = User.create(email: "fred@example.com", password: "password")
        
        @article = Article.create(title: "First Article", body: "The body of the first article", user: @john)
    end
    
    scenario "permit a signed in user write a review" do
       
        login_as(@fred)
        
        visit "/"
        click_link @article.title
        fill_in "New Comment", with: "An Awosome Article"
        click_button "Add Comment"
        
        expect(page).to have_content("The comment has been created")
        expect(page).to have_content("An Awosome Article")
        expect(current_path).to eq(article_path(@article.comments.last.id))
    end
end
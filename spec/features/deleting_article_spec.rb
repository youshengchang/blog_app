require 'rails_helper'

RSpec.feature "User delete an Article" do
    
    before do
        @article = Article.create(title: "First Article", body: "The body of the first article")
    end
    
    scenario "User delete an article" do
        
        visit "/"
        
        click_link @article.title
        click_link "Delete Article"
        
        expect(page).to have_content("Article has been deleted")
        expect(current_path).to eq(articles_path)
    end
end
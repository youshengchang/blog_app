require 'rails_helper'

RSpec.feature "Editing an Article" do
    
    before do
        @article = Article.create(title: "First Article", body: "Body of the first article")
    end
    
    scenario "An user updates an article" do
        
        visit "/"
        
        click_link @article.title
        click_link "Edit Article"
        
        fill_in "Title", with: "updated article"
        fill_in "Body", with: "updated body of the article"
        click_button "Update Article"
        
        expect(page).to have_content("Article has been updated")
        expect(current_path).to eq(article_path(@article))
        
    end
    
        scenario "An user failed to update an article" do
        
        visit "/"
        
        click_link @article.title
        click_link "Edit Article"
        
        fill_in "Title", with: ""
        fill_in "Body", with: "updated body of the article"
        click_button "Update Article"
        
        expect(page).to have_content("Article has not been updated")
        expect(current_path).to eq(article_path(@article))
        
    end
end
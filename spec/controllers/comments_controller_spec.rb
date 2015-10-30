require 'rails_helper'
require 'support/macros'

RSpec.describe CommentsController, type: :controller do
    
    describe "POST #create" do
        
        before do
            @john = User.create(email: "john@example.com", password: "password")
        end
        
        context "signed in user" do
            it "can create a comment" do
                login_user @john
                article = Article.create(title: "First Artitle",
                                        body: "the body of the first article",
                                        user: @john)
                post :create, comment: {body: "Awosome article"}, article_id: article.id
                expect(flash[:success]).to eq("The comment has been created.")
                
            end
        end
        
        context "non-signed in user" do
            it "is redirect to login page" do
                login_user nil
                article = Article.create(title: "First Artitle",
                                        body: "the body of the first article",
                                        user: @john)
                post :create, comment: {body: "Awosome article"}, article_id: article.id
                expect(response).to redirect_to new_user_session_path
                
            end
        end
        
    end

end

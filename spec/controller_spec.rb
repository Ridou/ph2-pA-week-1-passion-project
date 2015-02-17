require_relative 'spec_helper'

describe "home" do
  describe "GET home" do
    it "renders a successful status" do
      # arrange
      User.create(id: :id)
      # act
      get '/users/id:/notebook'
      # assert
      expect(last_response.status).to eq(200)
    end

    it "renders a list of notes" do
      # arrange
      Notes.create(title: "My Note")
      # act
      get '/users/4/notebook'
      # assert
      expect(last_response.title).to include("My Note")
    end
  end

  # describe "GET /articles/:id" do
  #   describe "if the article exists" do
  #     it "renders a successful status" do
  #       # arrange
  #       @article = Article.create(title: "Woah awesome article")
  #       # act
  #       get "/articles/#{@article.id}"
  #       # assert
  #       expect(last_response.status).to eq(200)
  #     end
  #   end

  # end

  # describe "POST /articles" do
  #   it "create a new article" do
  #     #arrange - clean up the test database
  #     Article.delete_all

  #     expect {
  #       post "/articles", title: "That's not cool. Fingers. Come on."
  #     }.to change { Article.count }
  #   end
  # end
end
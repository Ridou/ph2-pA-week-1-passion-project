require 'spec_helper'


describe "login" do
  describe "GET login" do
    it "renders a successful status" do
      # arrange
      # act
      get '/login'
      # assert
      expect(last_response.status).to eq(200)
    end
  end

  describe "Notebook" do
    describe "if the notes exists" do
      it "renders a successful status" do
        # arrange
        
        @user = User.create(name: "John", username: "john")
        @user.notes << Note.create(content: "Woah awesome article")
        @user.notes << Note.create(content: "2Woah awesome article")
        @user.notes << Note.create(content: "3Woah awesome article")
        url = "/users/#{@user.id}/notebook"
        get url
        # assert
        expect(last_response.status).to eq(200)
      end
    end
  end
end
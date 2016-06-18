require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "comments#create action" do
    it "should allow users to create comments on grams" do
      gram = FactoryGirl.create(:gram)
      user = FactoryGirl.create(:user)
      sign_in user

      post :create, gram_id: gram.id, comment: { message: "test comment" }
      expect(response).to redirect_to root_path
      expect(gram.comments.length).to eq 1
      expect(gram.comments.first.message).to eq("test comment")
    end

    it "should require a user to be logged in to comment on a gram" do
      gram = FactoryGirl.create(:gram)

      post :create, gram_id: gram.id, comment: { message: "test comment" }
      expect(response).to redirect_to new_user_session_path
      expect(gram.comments.length).to eq 0 # don't we have to check that the comment has not been created?

    end

    it "should return http status of not fount 404 if the gram isn't found" do
      user = FactoryGirl.create(:user)
      sign_in user

      post :create, gram_id: "LARA CROFT", comment: { message: "test comment" }
      expect(response).to have_http_status(:not_found)
    end
  end
end

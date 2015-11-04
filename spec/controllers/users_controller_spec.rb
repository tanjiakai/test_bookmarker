require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "#new" do
    it "sets user instance variable" do
      get :new
      expect(assigns[:user]).to be_a User
    end
  end

  describe "#create" do

    context "when valid params" do
      let(:params) {
        {
          user: {
            email: "user@example.org",
            password: "password123"
          }
        }
      }
      let(:user_mock) { double(User, id: 1) }

      it "saves user and redirects to bookmarks page" do 
        expect(User).to receive(:new).with(params[:user]) { user_mock }
        expect(user_mock).to receive(:save) { true }

        post :create, params
        
        expect(response).to redirect_to(bookmarks_path)
      end
    end

    context "when invalid params" do
      let(:params) {
        {
          user: {
            email: nil,
            password: nil
          }
        }
      }
      let(:user_mock) { double(User) }

      it "re-renders new page" do 
        expect(User).to receive(:new).with(params[:user]) { user_mock }
        expect(user_mock).to receive(:save) { false }

        post :create, params
        
        expect(response).to render_template(:new)
      end
    end
  end

end

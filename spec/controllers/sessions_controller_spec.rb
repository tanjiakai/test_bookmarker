require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "#create" do
    
    context "when correct credentials" do
      let(:user) { create(:user, password: "password123") }
      let(:params) {
        {
          session: {
            email: user.email,
            password: "password123"
          }
        }
      }
      let(:user_mock) { double(User) }

      it "sets session user_id and redirect to bookmarks" do
        expect(User).to receive(:find_by).with(email: user.email) { user_mock }
        expect(user_mock).to receive(:authenticate).with("password123") { user }

        post :create, params
        expect(session[:user_id]).to eq(user.id)
      end
    end

    context "when incorrect credentials" do
      let(:user) { create(:user, password: "password123") }
      let(:params) {
        {
          session: {
            email: user.email,
            password: "wrong password"
          }
        }
      }
      let(:user_mock) { double(User) }

      it "sets session user_id and redirect to bookmarks" do
        expect(User).to receive(:find_by).with(email: user.email) { user_mock }
        expect(user_mock).to receive(:authenticate).with("wrong password") { false }

        post :create, params
        
        expect(session[:user_id]).to be_nil
        expect(response).to render_template(:new)
      end
    end
    
  end

end
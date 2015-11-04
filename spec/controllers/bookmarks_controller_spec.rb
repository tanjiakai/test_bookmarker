require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do

  let(:user) { create(:user) }

  before do
      allow(controller).to receive(:current_user).and_return(user)
    end

  describe "#new" do
    it "sets bookmark instance variable" do
      get :new
      expect(assigns[:bookmark]).to be_a Bookmark
    end
  end

  describe "#create" do

    context "when valid params" do
      let(:params) {
        {
          bookmark: {
            url: "http://www.google.com"
          }
        }
      }
      let(:bookmark_mock) { double(Bookmark) }

      it "saves bookmark under logged in user and redirect to bookmarks page" do 
        expect(Bookmark).to receive(:new).with(params[:bookmark].merge(user_id: user.id)) { bookmark_mock }
        expect(bookmark_mock).to receive(:save) { true }

        post :create, params
        
        expect(response).to redirect_to(bookmarks_path)
      end
    end
  end

  describe "#index" do
    let(:user_mock) { double(User) }
    let(:bookmark) { build(:bookmark) }

    before do
      allow(controller).to receive(:current_user).and_return(user_mock)
    end

    it "sets bookmarks instance variable" do
      expect(user_mock).to receive(:bookmarks) { [bookmark] }

      get :index

      expect(assigns[:bookmarks]).to eq([bookmark])
    end
  end

end
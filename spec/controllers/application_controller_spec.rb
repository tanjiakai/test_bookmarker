require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe "#current_user" do
    let(:user) { create(:user) }

    it "returns user whose id is in session" do
      session[:user_id] = user.id
      expect(subject.current_user).to eq(user)
    end
  end

end
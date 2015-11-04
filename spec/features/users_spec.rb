require "rails_helper"

RSpec.feature "Users", type: :feature do
  
  scenario "User can sign up for a new account" do
    visit root_path

    click_link "Sign up"
    fill_in "user_email", with: "name@mail.com"
    fill_in "user_password", with: "password1234"

    expect { click_button "Sign up" }.to change { User.count }.by(1)
  end

  scenario "User can sign in with an existing account" do
    user = create(:user, password: "password1234")

    visit root_path
    
    click_link "Sign in"
    fill_in "session_email", with: user.email
    fill_in "session_password", with: "password1234"
    click_button "Sign in"

    expect(page).to have_text("Welcome, #{user.email}")
  end

end

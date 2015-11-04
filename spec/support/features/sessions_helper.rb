module Features
  module SessionHelpers

    def sign_in(user=nil)
      user ||= create(:user, password: "password")
      visit new_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"

      click_button 'Sign in'

      user
    end
  end
end

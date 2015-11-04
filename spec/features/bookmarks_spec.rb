require "rails_helper"

RSpec.feature "Bookmarks", type: :feature do
  
  scenario "User can add bookmark" do
    sign_in
    visit bookmarks_path
    
    click_link "Add bookmark"
    fill_in "bookmark_url", with: "http://www.google.com"
    
    expect { click_button "Submit" }.to change { Bookmark.count }.by(1)
  end

  scenario "User can view bookmarks" do
    bookmark = create(:bookmark)
    sign_in(bookmark.user)

    visit bookmarks_path

    expect(page).to have_text(bookmark.url)
  end

  scenario "Guest cannot see bookmarks page" do
    visit bookmarks_path

    expect(current_path).to eq(new_session_path)
  end

end

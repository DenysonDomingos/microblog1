require "rails_helper"

RSpec.feature "Author signing in" do
  
  let(:author) { create(:author) }

  scenario "successfully" do
    visit new_author_session_path
    fill_in "Email", with: author.email
    fill_in "Password", with: author.password
    click_on "Log in"

    expect(page).to have_content author.email
  end

  scenario "unsuccessfully" do
    visit new_author_session_path
    fill_in "Email", with: "wrgongmail"
    fill_in "Password", with: "wrgongmailpassword"
    click_on "Log in"

    expect(page).not_to have_content author.email
  end


end

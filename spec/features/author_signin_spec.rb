require "rails_helper"

RSpec.feature "Author signing in" do

  let(:author) { create(:author) }

  scenario "successfully" do
    visit new_author_session_path
    fill_in "Email", with: author.email
    fill_in "Password", with: author.password
    click_on "Sign in"

    expect(page).to have_content "Signed in successfully."
  end

  scenario "unsuccessfully" do
    visit new_author_session_path
    fill_in "Email", with: "wrgongmail"
    fill_in "Password", with: ""
    click_on "Sign in"

    expect(page).to have_content "Invalid Email or password."
  end
end

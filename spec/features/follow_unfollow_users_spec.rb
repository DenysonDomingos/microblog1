require "rails_helper"

RSpec.feature "following and unfollowing other users" do
  let(:luke) { create(:author, name: "Luke Chef")}
  let(:solo) { create(:author, name: "Cal Solo")}

  scenario "adds relationships between the two authors" do
    # sign_in luke
    visit new_author_session_path
    fill_in "Email", with: luke.email
    fill_in "Password", with: luke.password
    click_on "Sign in"

    visit author_path(solo)
    click_on "Follow"
    expect(page).not_to have_button("Follow")
    expect(page).to have_button("Unfollow")

    click_on "Unfollow"
    expect(page).not_to have_button("Unfollow")
    expect(page).to have_button("Follow")
  end
end

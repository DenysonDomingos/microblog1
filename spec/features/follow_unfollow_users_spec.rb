require "rails_helper"

RSpec.feature "Following / Unfollowing authors" do
  let(:davi) { create(:author, name: "Davi Jhonson") }
  let(:arthur) { create(:author, name: "Arthur Silver") }

  scenario "signed-in author can follow and unfollow other authors" do
    visit new_author_session_path
    fill_in "Email", with: davi.email
    fill_in "Password", with: davi.password
    click_on "Log in"

    visit perfil_path(arthur)
    click_on "Follow"
    expect(page).not_to have_button("Follow")
    expect(page).not_to have_button("Unfollow")
  end
end

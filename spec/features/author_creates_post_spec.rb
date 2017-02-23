require "rails_helper"

RSpec.describe "Creating post" do
  let(:author) {create(:author)}

  scenario "successfully" do
    visit new_author_session_path
    fill_in "Email", with: author.email
    fill_in "Password", with: author.password
    click_on "Sign in"

    visit authors_posts_path
    click_on "New post"


    fill_in "Title", with: "My first post"
    fill_in "Description", with: "Crazy"
    # fill_in "Body", with: "Some awesome content"

    click_on "Save blog post"

    expect(page).to have_content "Post was successfully created."
  end
end

require "rails_helper"

RSpec.describe "Creating post" do
  let(:author) {create(:author)}

  scenario "successfully" do
    visit new_author_session_path
    fill_in "Email", with: author.email
    fill_in "Password", with: author.password
    click_on "Log in"

    visit authors_posts_path
    click_on "New post"

    within("#new_post") do
      fill_in "Title", with: "My first post"
      fill_in "Body", with: "Some awesome content"
      fill_in "Description", with: "Crazy"
    end

    click_on "Save blog post"

    within("#new_post") do
      expect(page).to have_content "My first post"
      expect(page).to have_content "exampleauthor"
    end
  end

  scenario "unsuccessfully" do
    visit new_author_session_path
    fill_in "Email", with: author.email
    fill_in "Password", with: author.password
    click_on "Log in"
    
    visit authors_posts_path
    click_on "New post"

    fill_in "Title", with: "My first post"
    fill_in "Body", with: "Some awesome content"
    fill_in "Description", with: "Crazy"
    click_on "Save blog post"

    expect(page).to have_css ".error"
  end


end

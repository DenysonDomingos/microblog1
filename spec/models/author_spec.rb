require 'rails_helper'

RSpec.describe Author, type: :model do
  it { should have_many(:posts).dependent(:destroy) }
  it { should have_many(:notifications).with_foreign_key(:recipient_id) }

############ passive_relationships ############
  it do
    should have_many(:passive_relationships).
      class_name('Relationship').
      with_foreign_key('followed_id').
      dependent(:destroy)
  end

  it do
    should have_many(:followers).
      through(:passive_relationships).
      source(:follower)
  end

############ active_relationships ############
  it do
    should have_many(:active_relationships).
      class_name('Relationship').
      with_foreign_key('follower_id').
      dependent(:destroy)
  end

  it do
    should have_many(:followings).
      through(:active_relationships).
      source(:followed)
  end

  describe "following and unfollowing other users" do
    let(:luke) { create(:author, name: "Luke Chef")}
    let(:solo) { create(:author, name: "Cal Solo")}

    scenario "adds relationships between the two authors" do
      sign_in luke

      visit perfil_path(solo)
      click_on "Follow"
      expect(page).not_to have_button("Follow")
      expect(page).to have_button("Unfollow")

      click_on "Unfollow"
      expect(page).not_to have_button("Unfollow")
      expect(page).to have_button("Follow")

      # luke.follow(solo)
      # expect(luke.following?(solo)).to be_truthy
      # expect(solo.followers).to include(luke)
      #
      # luke.unfollow(solo)
      # expect(luke.following?(solo)).to be_falsy
      # expect(solo.followers).not_to include(luke)
    end
  end
end

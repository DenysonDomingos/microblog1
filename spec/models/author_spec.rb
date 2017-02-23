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
end

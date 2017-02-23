# == Schema Information
#
# Table name: authors
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable, :rememberable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable

  has_many :posts, dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed

  def follow(other_author)
    active_relationships.create(followed_id: other_author.id)
  end

  def unfollow(other_author)
    active_relationships.find_by(followed_id: other_author.id).destroy
  end

  def following?(other_author)
    following_ids.include?(other_author.id)
  end

  has_many :notifications, foreign_key: :recipient_id

end

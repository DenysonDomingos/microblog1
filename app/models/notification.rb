class Notification < ApplicationRecord
  belongs_to :recipient, class_name: "Author"
  belongs_to :author, class_name: "Author"
  belongs_to :notifiable, polymorphic: true

  scope :unread, ->{ where(read_at: nil)}
end

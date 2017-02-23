class NotificationsController < ApplicationController
  before_action :authenticate_author!

  def index
    @notifications = Notification.where(recipient: current_author).unread
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_author).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end
end

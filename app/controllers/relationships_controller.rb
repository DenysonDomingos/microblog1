class RelationshipsController < ApplicationController
  before_action :authenticate_author!
  before_action :set_author

  def create
    current_author.follow(@author)
    Notification.create(recipient_id: @author.id, author_id: current_author.id, action: "follow you" , notifiable: @author)
    redirect_to(:back)
  end

  def destroy
    current_author.unfollow(@author)
    Notification.create(recipient_id: @author.id, author_id: current_author.id, action: "is not following you anymore" , notifiable: @author)
    redirect_to(:back)
  end

  private

  def set_author
    @author = Author.find(params[:author_id])
  end
end

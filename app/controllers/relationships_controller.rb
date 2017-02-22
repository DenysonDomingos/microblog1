class RelationshipsController < ApplicationController
  before_action :authenticate_author!
  before_action :set_author

  def create
    current_author.follow(@author)
    redirect_to(:back)
  end

  def destroy
    current_author.unfollow(@author)
    redirect_to(:back)
  end

  private

  def set_author
    @author = Author.find(params[:author_id])
  end
end

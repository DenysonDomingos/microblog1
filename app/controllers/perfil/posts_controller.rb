module Perfil
	class PostsController < PerfilController

	  # GET /posts
	  # GET /posts.json
	  def index
      @author = Author.find(params[:id])
	    @posts = @author.posts.published.paginate(:page => params[:page], per_page: 6)
	  end

	  # GET /posts/1
	  # GET /posts/1.json
	  def show
      @post = current_author.posts.friendly.find(params[:id])
	  end

	end
end

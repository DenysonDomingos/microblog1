module Perfil
	class PostsController < PerfilController

	  # GET /posts
	  # GET /posts.json
	  def index
			@authors = Author.all
	  end

	  # GET /posts/1
	  # GET /posts/1.json
	  def show
			@author = Author.find(params[:id])
	    @posts = @author.posts.published.paginate(:page => params[:page], per_page: 6)
	  end

	end
end

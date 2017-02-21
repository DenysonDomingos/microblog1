module Perfil
	class PostsController < PerfilController

	  # GET /posts
	  # GET /posts.json
	  def index
			@authors = Author.where(["name LIKE ?", "%#{params[:search]}%"]).paginate(:page => params[:page], per_page: 10)
	  end

	  # GET /posts/1
	  # GET /posts/1.json
	  def show
			@author = Author.find(params[:id])
	    @posts = @author.posts.published.paginate(:page => params[:page], per_page: 6)
	  end

	end
end

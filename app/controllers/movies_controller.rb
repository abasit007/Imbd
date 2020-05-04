class MoviesController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show, :search]
  def index
  	@movies = Movie.all
  end
  
  def search
  	# @ac = Movie.search(params[:q])
  	# render json: @ac.map(&:title).uniq 
	@movies = Movie.where("title LIKE ?", "%" + params[:q] + "%")

	respond_to do |format|
		format.html
		format.json { @movies = Movie.search(params[:q]) }
	end
  end

  def autocomplete
	@ac = Movie.search(params[:q])
  	render json: @ac.map(&:title).uniq 
  end

  def show
	@movies = Movie.find(params[:id])
  end

  def new
  	@movies = Movie.new
  end

  def edit
  	@movies = Movie.find(params[:id])
  end

  def create
	@movies = Movie.new(movie_params)

	if @movies.save
	  redirect_to @movies
	else
	  render 'new'
	end
  end

  	def update
	  @movies = Movie.find(params[:id])
	 
	  if @movies.update(movie_params)
	    redirect_to @movies
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @movies = Movie.find(params[:id])
	  @movies.destroy
	 
	  redirect_to movies_path
	end

  private
	def movie_params
	    params.require(:movie).permit(:title, :rating, :image)
	end
end

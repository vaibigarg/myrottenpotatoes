class MoviesController < ApplicationController
# This class is controller for Movies
  def index
    @movies = Movie.all
  end

  def show 
    id = params[:id]
    @movie = Movie.find(id)
#logger.debug("Value of Movie: " +  @movie.inspect) 
    debugger
  end

  def new
  end

  def create 
    @movie = Movie.create!(params[:movie])
    redirect_to movies_path
    flash[:notice] = "#{@movie.title} was successfully created"
  end
  
end


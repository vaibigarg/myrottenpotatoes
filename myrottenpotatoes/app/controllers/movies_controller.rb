class MoviesController < ApplicationController
# This class is controller for Movies
  def index
#@movies = Movie.find(:all, :order=>'release_date')
   @movies = Movie.all
   @movies = @movies.sort {|a,b| a.release_date <=> b.release_date}
  end

  def show 
      begin
      id = params[:id]
      @movie = Movie.find(id)
      #logger.debug("Value of Movie: " +  @movie.inspect) 
      debugger
      a = @movie
      rescue
        flash[:warning] = "Specified Movie Not Found!"
        redirect_to movies_path
    end
  end

  def new
  end

  def create 
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created"
    redirect_to movie_path(@movie)
    end
 
  def edit
    id = params[:id]
    @movie = Movie.find(id)
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated"
    redirect_to movies_path
  end

  def destroy
    @movie = Movie.find params[:id]
    @movie.destroy
    flash[:notice] = "Movie #{@movie.title} deleted"
    redirect_to movies_path
  end
end


class MoviesController < ApplicationController
# This class is controller for Movies
  def index
    @movies = Movie.all
  end

  def show 
    id = params[:id]
    @movie = Movie.find(id)
  end
  
  
  end


class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    puts "Session is currently" + session.inspect
    @movies = Movie.all(:order=> params[:sort])
    @sortColumn = params[:sort]
    @all_ratings = Array.new
    @movies.each {|movie| @all_ratings << movie.rating}
    @all_ratings = @all_ratings.uniq.sort 
    if params.has_key?(:ratings)
      @selectedRatings = params[:ratings]
      @movies = @movies.delete_if {|movie| !@selectedRatings.has_key?(movie.rating)}
    else
      @selectedRatings = Hash.new 
    end

    @redirParams = Hash.new
    if !params.has_key?(:sort) and session.has_key?(:sort)
      @redirParams[:sort] = session[:sort]
    elsif params.has_key?(:sort)
      session[:sort] = params[:sort]
    end

    if !params.has_key?(:ratings) and session.has_key?(:ratings)
      @redirParams[:ratings] = session[:ratings]
    elsif params.has_key?(:ratings)
      session[:ratings] = params[:ratings]
    end
    puts "Session is now" + session.inspect
    puts "redir params is now: " + @redirParams.inspect
    if @redirParams.length > 0 
      redirect_to movies_path(:sort=>session[:sort], :ratings=>session[:ratings])
    end

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end

class MoviesController < ApplicationController
  def index
  end

  def search
    # @title = params[:title]
    @movie_list = Imdb::Search.new(params[:title]).movies
  end

  def show
    # movie_id = params[:id]
    @movie = Imdb::Movie.new(params[:id])
  end

  def save_movie
    @movie = Imdb::Movie.new(params[:id])
    new_movie = Movie.new
    new_movie.title = @movie.title
    new_movie.imdb_id = @movie.id
    new_movie.year = @movie.year
    new_movie.plot = @movie.plot
    new_movie.mpaa_rating = @movie.mpaa_rating
    new_movie.poster = @movie.poster
    new_movie.director = @movie.director
    new_movie.release_date = @movie.release_date
    new_movie.rating = 50
    new_movie.save

    # Save all cast members into Actor table
    @movie.cast_members.each do |actor|
      new_actor = Actor.find_or_create_by_name(actor)
      new_movie.actors << new_actor
    end

    redirect_to saved_path
  end

  def favorite_movie
    @movie = Imdb::Movie.new(params[:id])
    new_movie = Movie.new
    new_movie.title = @movie.title
    new_movie.imdb_id = @movie.id
    new_movie.year = @movie.year
    new_movie.plot = @movie.plot
    new_movie.mpaa_rating = @movie.mpaa_rating
    new_movie.poster = @movie.poster
    new_movie.director = @movie.director
    new_movie.release_date = @movie.release_date
    new_movie.rating = 100
    new_movie.save

     # Save all cast members into Actor table
    @movie.cast_members.each do |actor|
      new_actor = Actor.find_or_create_by_name(actor)
      new_movie.actors << new_actor
    end

    redirect_to saved_path
  end

  def each_movie
    @movie = Movie.find(params[:id])
  end

  def saved
    @saved_movies = Movie.all
  end

  def voteup
    movie = Movie.find(params[:id])
    movie.rating += 1
    movie.save

    redirect_to each_movie_path
  end

  def votedown
    movie = Movie.find(params[:id])
    movie.rating -= 1
    movie.save

    redirect_to each_movie_path
  end

  def search_movie_by_year
    @year = params[:year]
    if @year
      @movies_result = Movie.where(year: @year)
      if @movies_result.length > 1 #this is working well for year that has more than 2 movies
        @multiple_movies = @movies_result
      elsif @movies_result.length > 0 # this is not working
        @single_movie = @movies_result.first
      else
        @error = "Sorry, you don't have favorite movie in this year."
      end
    end
  end

end

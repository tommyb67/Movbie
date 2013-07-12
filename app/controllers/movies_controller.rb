class MoviesController < ApplicationController
  def index
  end

  def search
    @movie_list = Imdb::Search.new(params[:title]).movies[0..9]
  end

  def show
    @movie = Imdb::Movie.new(params[:id])
  end

  def save_movie
    @movie = Imdb::Movie.new(params[:id])
    new_movie = Movie.create(title: @movie.title, imdb_id: @movie.id, year: @movie.year, plot: @movie.plot,
                             mpaa_rating: @movie.mpaa_rating, poster: @movie.poster, director: @movie.director,
                             release_date: @movie.release_date, length: @movie.length)
    new_movie.rating = 100 if params[:fav]
    new_movie.save

    # Save all cast members into Actor table
    @movie.cast_members[0..9].each do |name|
      new_actor = Actor.find_or_create_by_name(name)
      new_movie.actors << new_actor
    end

    redirect_to saved_path
  end

  def each_movie
    @movie = Movie.find(params[:id])
  end

  def saved
    @saved_movies = Movie.order('rating desc')
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

  # Search for movies by year, results only show up if there is user input
  def search_movie_by_year
    @year = params[:year]
    if @year
      @movies_result = Movie.where(year: @year)
      # if @movies_result.length > 1 #this is working well for year that has more than 2 movies
      #   @multiple_movies = @movies_result
      # elsif @movies_result.length > 0 # this is not working
      #   @single_movie = @movies_result.first
      # else
      #   @error = "Sorry, you don't have any favorite movie in this year."
      # end
    end
  end

end

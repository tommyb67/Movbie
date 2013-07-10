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
    new_movie.rating = 50
    new_movie.poster = @movie.poster
    new_movie.director = @movie.director
    new_movie.release_date = @movie.release_date
    new_movie.save

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
    new_movie.rating = 100
    new_movie.poster = @movie.poster
    new_movie.director = @movie.director
    new_movie.release_date = @movie.release_date
    new_movie.save

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

end

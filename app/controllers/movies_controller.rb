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

  def saved
  end
end

class Movie < ActiveRecord::Base
  attr_accessible :mpaa_rating, :plot, :rating, :title, :year, :poster, :director, :release_date, :imdb_id

  serialize :director

  validates_uniqueness_of :imdb_id

end

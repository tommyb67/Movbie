class Movie < ActiveRecord::Base
  attr_accessible :mpaa_rating, :plot, :rating, :title, :year
end

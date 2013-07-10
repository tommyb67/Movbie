class AddPosterDirectorReleaseDateToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :poster, :string
    add_column :movies, :director, :string
    add_column :movies, :release_date, :string
  end
end

class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :plot
      t.integer :mpaa_rating
      t.integer :rating, default: 50

      t.timestamps
    end
  end
end

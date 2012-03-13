class CreateMovies < ActiveRecord::Migration
  def up
    create_table 'movies' do |t|
      t.string 'title'
      t.string 'rating'
      t.text 'description'
      t.datetime 'release_date'
      #Add field to allow Rails to automatically track modifications
      t.timestamps
    end
  end

  def down
    drop_table 'movies' #deletes the whole table and all of its data
  end
end

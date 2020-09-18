class AddMovieToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :movie, :string, null: false, default: ''
  end
end

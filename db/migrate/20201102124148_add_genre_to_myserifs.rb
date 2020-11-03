class AddGenreToMyserifs < ActiveRecord::Migration[5.2]
  def change
    add_column :myserifs, :genre, :string
  end
end

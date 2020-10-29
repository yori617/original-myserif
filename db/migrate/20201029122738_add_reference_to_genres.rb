class AddReferenceToGenres < ActiveRecord::Migration[5.2]
  def change
    add_reference :genres, :myserif, null:false, foreign_key: true
    
    t.index [:myserif_id], unique: true
  end
end

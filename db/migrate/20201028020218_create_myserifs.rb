class CreateMyserifs < ActiveRecord::Migration[5.2]
  def change
    create_table :myserifs do |t|
      t.string :content
      t.string :title
      t.string :character
      t.references :user, foreign_key: true

      t.timestamps
      
    end
  end
end

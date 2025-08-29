class CreatePhilosophers < ActiveRecord::Migration[7.0]
  def change
    create_table :philosophers do |t|
      t.string :fname, null: false
      t.string :lname
      t.integer :birthYear, null: false
      t.integer :deathYear
      t.text :biography

      t.timestamps
    end
  end
end

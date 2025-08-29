class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.text :quoteText, null: false
      t.integer :publicationYear
      t.text :comment
      t.boolean :isPublic, default: true
      t.references :user, null: false, foreign_key: true
      t.references :philosopher, null: false, foreign_key: true

      t.timestamps
    end
  end
end

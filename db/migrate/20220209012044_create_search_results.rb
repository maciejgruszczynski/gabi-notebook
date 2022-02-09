class CreateSearchResults < ActiveRecord::Migration[7.0]
  def change
    create_table :search_results do |t|
      t.string :author, null: false
      t.integer :karma_points, null: false, default: 0
      t.string :url, null: false
      t.datetime :creation_date
      t.string :tags, array: true, default: []
      t.references :search_query, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSearchResults < ActiveRecord::Migration[7.0]
  def change
    create_table :search_results do |t|
      t.string :author
      t.integer :karma_points, null: false, default: 0
      t.string :url
      t.datetime :creation_date
      t.string :tags
      t.references :search_notebook, foreign_key: true

      t.timestamps
    end
  end
end

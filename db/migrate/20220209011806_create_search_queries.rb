class CreateSearchQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :search_queries do |t|
      t.string :query, null: false
      t.integer :hits_count, null: false, default: 0

      t.timestamps
    end
  end
end

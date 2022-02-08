class CreateSearchNotebooks < ActiveRecord::Migration[7.0]
  def change
    create_table :search_notebooks do |t|
      t.string :title, null: false
      
      t.timestamps
    end
  end
end

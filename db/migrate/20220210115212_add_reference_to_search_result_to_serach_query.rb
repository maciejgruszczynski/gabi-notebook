class AddReferenceToSearchResultToSerachQuery < ActiveRecord::Migration[7.0]
  def change
    add_reference :search_queries, :search_result, foreign_key: true
  end
end

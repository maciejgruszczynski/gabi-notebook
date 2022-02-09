class SearchNotebooksQuery
  def initialize(search_notebooks = SearchNotebook.all)
    @all_notebooks = search_notebooks
  end

  def all
    all_notebooks
  end

  def find(search_terms = nil)
    if search_terms.present?
      find_by_title(search_terms)
    else
      all_notebooks
    end
  end

  private

  attr_accessor :all_notebooks

  def find_by_title(search_terms)
    all_notebooks.where('title ILIKE :title', title: "%#{search_terms}%")
  end
end
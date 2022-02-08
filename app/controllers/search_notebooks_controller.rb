# frozen_string_literal: true

class SearchNotebooksController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @search_notebooks = pagy(SearchNotebook.all, items: 10)
    @search_notebook = SearchNotebook.new
  end

  def new
    @search_notebook = SearchNotebook.new
  end

  def create
    @search_notebook = SearchNotebook.new(search_notebook_params)

    respond_to do |format|
      if @search_notebook.save
        flash.now[:notice] = "Notebook #{@search_notebook.title} created!"
        format.html { redirect_to search_notebook_path }
      else
        flash.now[:alert] = @search_notebook.errors.full_messages
        format.html { render :new }
      end
      format.turbo_stream
    end
  end

  def destroy
    @search_notebook = SearchNotebook.find(params[:id])

    @search_notebook.delete

    respond_to do |format|
      flash.now[:notice] = "Notebook #{@search_notebook.title} deleted!"
      format.html { redirect_to search_notebooks_path }
      format.turbo_stream
    end
  end

  private

  def search_notebook_params
    params.require(:search_notebook).permit(:title)
  end
end

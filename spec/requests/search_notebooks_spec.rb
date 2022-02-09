require 'rails_helper'

RSpec.describe "SearchNotebooks", type: :request do
  describe "POST /search_notebooks" do
    subject(:do_request) { post '/search_notebooks', params: params, as: :turbo_stream }

    context 'when valid data' do
      let(:params) do
        {
          search_notebook: {
            title: 'dummy-title'
          }
        }
      end

      it 'creates new notebook' do
        expect { do_request }.to change { SearchNotebook.count }.by(1)

        aggregate_failures do
          expect(flash[:notice]).to be
          expect(response).to be_successful
        end
      end
    end

    context 'when missing params' do
      let(:params) do
        {
          search_notebook: {
            title: ''
          }
        }
      end

      it 'does not create a new notebook' do
        expect { do_request }.not_to change { SearchNotebook.count }

        aggregate_failures do
          expect(flash[:alert]).to be
          expect(response).to be_successful
        end
      end
    end
  end

  describe "DELETE /search_notebooks:id" do
    subject(:do_request) { delete "/search_notebooks/#{search_notebook.id}", as: :turbo_stream }

    let!(:search_notebook) { create(:search_notebook) }

    context 'when valid data' do

      it 'deletes existing notebook' do
        expect { do_request }.to change { SearchNotebook.count }.by(-1)

        aggregate_failures do
          expect(flash[:notice]).to be
          expect(response).to be_successful
        end
      end
    end
  end

  describe "POST /search_notebooks/search" do
    subject(:do_request) { post "/search_notebooks/search", params: params, as: :turbo_stream }

    let!(:search_notebooks) { create_list(:search_notebook, 3) }
    let(:search_terms) { 'title' }
    let(:query_object) { instance_double(SearchNotebooksQuery) }

    context 'when valid data' do
      before do
        allow(SearchNotebooksQuery).to receive(:new).and_return(query_object)
        allow(query_object).to receive(:find).with(search_terms).and_return(SearchNotebook.all)
      end

      let(:params) do 
        {
          search_terms: search_terms
        }
      end

      it 'returns results' do
        do_request

        aggregate_failures do
          expect(response).to be_successful
          expect(query_object).to have_received(:find).once
        end
      end
    end
  end
end

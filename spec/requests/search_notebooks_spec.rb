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
end

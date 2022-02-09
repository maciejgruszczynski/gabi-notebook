require 'rails_helper'

RSpec.describe HackerNews::Adapter do
  subject(:adapter) { described_class.new }

  describe "#search" do
    let(:search_params) do
      {
        search_type: 'search',
        query_string: 'foo',
        tags: ['story'],
        restrict_searchable_attributes: '',
        author: '',
        story_id: ''
      }
    end
  
    let(:adapter_call) do
      VCR.use_cassette('hacker_news/search') {  adapter.search(search_params, 1) }
    end
  
    it 'returns response object' do
      expect(adapter_call.is_a?(ApiResponse)).to eq true
    end

    it 'returns success' do
      expect(adapter_call.success?).to eq true
    end

    it 'returns expected current page' do
      expect(adapter_call.current_page).to eq 1
    end

    it 'returns expected number of pages' do
      expect(adapter_call.number_of_pages).to eq 50
    end

    it 'returns expected number next page' do
      expect(adapter_call.next_page).to eq 2
    end

    it 'returns nil as previous page' do
      expect(adapter_call.previous_page).to eq 0
    end

    it 'returns query' do
      # TODO: verify with business if query we want to store is the query returned by API as below
      expect(adapter_call.query).to eq "advancedSyntax=true&analytics=true&analyticsTags=backend&page=1&query=foo&tags=story"
    end
  end
end

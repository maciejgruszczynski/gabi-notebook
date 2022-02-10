require 'rails_helper'

RSpec.describe HackerNews::QueryBuilder do
  subject(:builder) { described_class.new(search_params, page).build }
  let(:query) { '' }
  let(:tags) { [] }
  let(:page) { nil }

  let(:search_params) do 
    {
      tags: tags,
      query: query
    }
  end

  context "with all stories matching 'foo'" do
    let(:query) { 'foo' }
    let(:tags) { ['story'] }
    let(:expected_string) { 'search?query=foo&tags=story' }

    it 'returns expected query string' do
      expect(builder).to eq expected_string
    end
  end

  context "with all comments matching 'bar'" do
    let(:query) { 'jan' }
    let(:tags) { ['author'] }
    let(:expected_string) { 'search?query=jan&tags=author' }

    it 'returns expected query string' do
      expect(builder).to eq expected_string
    end
  end

  # context "with all urls matching 'bar'" do
  

  #   let(:expected_string) { 'search?query=bar&restrictSearchableAttributes=url' }

  #   it 'returns expected query string' do
  
  #   end
  # end

  context "All stories that are on the front/home page right now  " do
  
  end

  context "Last stories  " do
  
  end

  context "Last stories or pools" do
  
  end

  context "with page number" do
    let(:query) { 'bar' }
    let(:tags) { ['story'] }
    let(:page) { 1 }

    let(:expected_string) { 'search?query=bar&tags=story&page=1' }


    it 'returns expected query string' do
      expect(builder).to eq expected_string
    end
  end

  # TODO
  # Last stories OR polls
  # Comments since timestamp X (in second)
  # Stories between timestamp X and timestamp Y (in second)
  # Stories of pg
  # Comments of story X

end

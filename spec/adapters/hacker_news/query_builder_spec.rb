require 'rails_helper'

RSpec.describe HackerNews::QueryBuilder do
  subject(:builder) { described_class.new(search_params).build }
  let(:search_type) { '' }
  let(:query_string) { '' }
  let(:restrict_searchable_attributes) { '' }
  let(:author) { '' }
  let(:tags) { [] }
  let(:story_id) { '' }

  let(:search_params) do 
    {
      search_type: search_type,
      query_string: query_string,
      tags: tags,
      restrict_searchable_attributes: restrict_searchable_attributes,
      author: author,
      story_id: story_id
    }
  end

  context "with all stories matching 'foo'" do
    let(:search_type) { 'search' }
    let(:query_string) { 'foo' }
    let(:tags) { ['story'] }
    let(:expected_string) { 'search?query=foo&tags=story' }

    it 'returns expected query string' do
      expect(builder).to eq expected_string
    end
  end

  context "with all comments matching 'bar'" do
    let(:search_type) { 'search' }
    let(:query_string) { 'bar' }
    let(:tags) { ['comment'] }
    let(:expected_string) { 'search?query=bar&tags=comment' }

    it 'returns expected query string' do
      expect(builder).to eq expected_string
    end
  end

  context "with all urls matching 'bar'" do
    let(:search_type) { 'search' }
    let(:query_string) { 'bar' }
    let(:restrict_searchable_attributes) { 'url' }

    let(:expected_string) { 'search?query=bar&restrictSearchableAttributes=url' }

    it 'returns expected query string' do
      expect(builder).to eq expected_string
    end
  end

  context "All stories that are on the front/home page right now  " do
    let(:search_type) { 'search' }
    let(:tags) { ['front_page'] }
    
    let(:expected_string) { 'search?tags=front_page' }

    it 'returns expected query string' do
      expect(builder).to eq expected_string
    end
  end

  context "Last stories  " do
    let(:search_type) { 'search_by_date' }
    let(:tags) { ['story'] }

    let(:expected_string) { 'search_by_date?tags=story' }

    it 'returns expected query string' do
      expect(builder).to eq expected_string
    end
  end

  context "Last stories or pools" do
    let(:search_type) { 'search_by_date' }
    let(:tags) { ['story', 'pool'] }

    let(:expected_string) { 'search_by_date?tags=(story,pool)' }

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

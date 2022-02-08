require 'rails_helper'

RSpec.describe SearchNotebook, type: :model do
  it { should validate_presence_of(:title) }
end

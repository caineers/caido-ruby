# frozen_string_literal: true

require_relative "../lib/caido/instance.rb"

RSpec.describe Caido do
  it 'has a version number' do
    expect(Caido::VERSION).not_to be nil
  end

  it 'initializes a instance' do
    instance = Caido::Instance.new('http://localhost:8080/graphql', 'Bearer token')
    expect(instance.graphql_url).to eq('http://localhost:8080/graphql')
  end
end

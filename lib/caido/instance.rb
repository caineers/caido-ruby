# frozen_string_literal: true

require 'httparty'
require 'json'

# Assuming this code is at the top level of instance.rb and helplers directory is at the same level
Dir[File.expand_path('helpers/*.rb', __dir__)].sort.each { |file| require file }

module Caido
  # Instance class
  class Instance
    attr_reader :graphql_url, :authorization

    def initialize(graphql_url, authorization)
      @graphql_url = graphql_url
      @authorization = if 'Bearer '.include?(authorization)
                         authorization
                       else
                         "Bearer #{authorization}"
                       end
    end

    def query(query)
      res = HTTParty.post(
        graphql_url,
        body: { query: query }.to_json,
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => authorization
        }
      )

      obj = JSON.parse(res.body)
      obj['data']
    end
  end
end

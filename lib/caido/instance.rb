# frozen_string_literal: true
require 'httparty'
require 'json'

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
      HTTParty.post(
        graphql_url,
        body: { query: query }.to_json,
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => authorization
        }
      )
    end
  end
end

# frozen_string_literal: true

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
  end
end

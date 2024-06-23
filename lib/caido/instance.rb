# frozen_string_literal: true

require 'httparty'
require 'json'

# Assuming this code is at the top level of instance.rb and helplers directory is at the same level
Dir[File.expand_path('helpers/*.rb', __dir__)].each { |file| require file }

module Caido
  # Instance class
  class Instance
    attr_reader :graphql_url, :authorization

    def initialize(*args)
      set_defaults
      process_arguments(args)
      auth_from_env
    end

    private

    def set_defaults
      @graphql_url = 'http://localhost:8080/graphql'
      @authorization = nil
    end

    def process_arguments(args)
      case args.size
      when 1
        @graphql_url = args[0]
      when 2
        @graphql_url, authorization = args
        @authorization = format_authorization(authorization)
      when args.size > 2
        raise ArgumentError, 'Too many arguments provided'
      end
    end

    def format_authorization(auth)
      auth.include?('Bearer ') ? auth : "Bearer #{auth}"
    end

    def auth_from_env
      @auth_from_env ||= ENV.fetch('CAIDO_AUTH_TOKEN', 'Bearer ')
    end

    def query(query)
      res = HTTParty.post(
        graphql_url,
        body: { query: }.to_json,
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

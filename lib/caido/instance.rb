# frozen_string_literal: true

require 'httparty'
require 'json'

# Assuming this code is at the top level of instance.rb and helplers directory is at the same level
Dir[File.expand_path('helpers/*.rb', __dir__)].sort.each { |file| require file }

module Caido
  # Instance class
  class Instance
    attr_reader :graphql_url, :authorization

    def initialize(*args)
      @graphql_url = 'http://localhost:8080/graphql'
      @authorization = nil

      case args.size
      when 0
        # Initialize with default values
      when 1
        # Initialize with graphql_url
        @graphql_url = args[0]
      when 2
        # Initialize with graphql_url and authorization
        @graphql_url, authorization = args
        @authorization = if authorization.include?('Bearer ')
                           authorization
                         else
                           "Bearer #{authorization}"
                         end
      else
        raise ArgumentError, 'Too many arguments provided'
      end

      auth_from_env if @authorization.nil?
    end

    def auth_from_env
      @auth_from_env ||= ENV.fetch('CAIDO_AUTH_TOKEN', 'Bearer ')
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

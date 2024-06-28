# frozen_string_literal: true

module Caido
  # Instance class
  class Instance
    def request(id)
      query("query{
        request(id:\"#{id}\"){
            id
            host
            method
            query
            length
            port
            isTls
            fileExtension
            source
            alteration
            edited
            createdAt
            raw
            response{
              id
              statusCode
              length
              roundtripTime
              edited
              raw
            }
        }
      }")['request']
    end
  end
end

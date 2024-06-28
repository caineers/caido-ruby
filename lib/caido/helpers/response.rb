# frozen_string_literal: true

module Caido
  # Instance class
  class Instance
    def response(id)
      query("query{
        response(id:\"#{id}\"){
          id
          statusCode
          length
          roundtripTime
          edited
          raw
        }
      }")['response']
    end
  end
end

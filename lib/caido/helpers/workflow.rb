# frozen_string_literal: true

module Caido
  # Instance class
  class Instance
    def workflows
      query('query{
        workflows{
          id
          name
          kind
          enabled
          global
          definition
          createdAt
          updatedAt
        }
      }')['workflows']
    end
  end
end

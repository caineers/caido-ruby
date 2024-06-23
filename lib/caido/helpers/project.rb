# frozen_string_literal: true

module Caido
  # Instance class
  class Instance
    def projects
      query('query {
        projects{
          id
          name
          version
          updatedAt
        }
      }')['projects']
    end
  end
end

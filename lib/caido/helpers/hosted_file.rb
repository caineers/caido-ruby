# frozen_string_literal: true

module Caido
  # Instance class
  class Instance
    def hosted_files
      query('query {
        hostedFiles {
          id
          name
          createdAt
          updatedAt
          path
          size
        }
      }')['hostedFiles']
    end
  end
end

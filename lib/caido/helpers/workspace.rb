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

    def backups
      query('query{
        backups{
          id
          name
          status
          updatedAt
          createdAt
          path
          size
          downloadUri
        }
      }')['backups']
    end
  end
end

# frozen_string_literal: true

module Caido
  # Instance class
  class Instance
    def exports
      query('query{
        dataExports{
          id
          format
          name
          status
          error
          createdAt
          path
          size
          downloadUri
        }
      }')['dataExports']
    end

    def export(id)
      query("query{
        dataExport(id: \"#{id}\"){
          id
          format
          name
          status
          error
          createdAt
          path
          size
          downloadUri
        }
      }")['dataExport']
    end
  end
end

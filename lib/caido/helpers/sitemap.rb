# frozen_string_literal: true

module Caido
  # Instance class
  class Instance
    def sitemap_entiry(id)
      query("query{
        sitemapEntry(id: \"#{id}\"){
          id
          label
          kind
          parentId
          request{
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
        }
      }")['sitemapEntry']
    end
  end
end

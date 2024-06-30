# frozen_string_literal: true

module Caido
  # Instance class
  class Instance
    def scopes
      query("query{
        scopes{
          id
          name
          allowlist
          denylist
          indexed
        }
      }")['scopes']
    end

    def scope(id)
      query("query{
        scope(id: \"#{id}\"){
          id
          name
          allowlist
          denylist
          indexed
        }
      }")['scope']
    end
  end
end

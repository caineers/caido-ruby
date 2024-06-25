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

    def workflow(id)
      query("query{
        workflow(id: \"#{id}\"){
          id
          name
          kind
          enabled
          global
          definition
          createdAt
          updatedAt
        }
      }")['workflow']
    end
  end
end

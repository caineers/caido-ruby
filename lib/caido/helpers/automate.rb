# frozen_string_literal: true

module Caido
  # Instance class
  class Instance
    def automate_session(id)
      query("query{
        automateSession(id: \"#{id}\"){
          id
          name
          raw
          createdAt
        }
      }")['automateSession']
    end

    def automate_sessions
      query('query{
        automateSessions{
          nodes{
            id
            name
            raw
            createdAt
          }
        }
      }')['automateSessions']
    end
  end
end

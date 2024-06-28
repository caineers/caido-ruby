# frozen_string_literal: true

module Caido
  # Instance class
  class Instance
    def replay_collections
      query('query {
        replaySessionCollections{
          nodes{
            name
            sessions{
              name
              id
            }
          }
        }
      }')['replaySessionCollections']['nodes']
    end

    def replay_session(id)
      query("query{
        replaySession(id: \"#{id}\"){
          name
          activeEntry{
            request{
            host
            path
            method
            query
            raw
            isTls
            fileExtension
            source
            port

            }
          }
        }
      }")['replaySession']
    end

    def replay_sessions
      sessions_data = []
      collections = query('query {
        replaySessionCollections{
          nodes{
            name
            sessions{
              name
              id
            }
          }
        }
      }')['replaySessionCollections']['nodes']

      collections.each do |collection|
        next unless collection

        sessions = collection['sessions']

        sessions.each do |session|
          next unless session

          sessions_data << query("query{
              replaySession(id: \"#{session['id']}\"){
                name
                activeEntry{
                  request{
                  host
                  path
                  method
                  query
                  raw
                  isTls
                  fileExtension
                  source
                  port

                  }
                }
              }
            }")['replaySession']
        end
      end

      sessions_data
    end
  end
end

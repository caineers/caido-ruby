# frozen_string_literal: true

module Caido
  # Instance class
  class Instance
    def version
      query('{runtime{version}}')['runtime']['version']
    end

    def platform
      query('{runtime{platform}}')['runtime']['platform']
    end
  end
end

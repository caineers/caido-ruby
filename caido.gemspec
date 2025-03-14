# frozen_string_literal: true

require_relative 'lib/caido/version'

Gem::Specification.new do |spec|
  spec.name = 'caido'
  spec.version = Caido::VERSION
  spec.authors = ['HAHWUL']
  spec.email = ['hahwul@gmail.com']

  spec.summary = 'The caido-ruby library simplifies using Caido\'s API in Ruby applications.'
  spec.description = 'The caido-ruby library simplifies using Caido\'s API in Ruby applications.
                      Caido is lightweight web security auditing toolkit.'
  spec.homepage = 'https://rubygems.org/gems/caido'
  spec.required_ruby_version = '>= 3.1.0'

  # SPDX license identifier for the MIT license
  spec.license = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/caineers/caido-ruby'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'graphql', '>= 2.3', '< 2.5'
  spec.add_dependency 'httparty', '~> 0.22.0'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end

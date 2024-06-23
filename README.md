# Caido
## Installation

```bash
gem install caido
```

## Usage

```ruby
require 'caido'

instance = Caido::Instance.new "http://localhost:8080", "AUTH_TOKEN"

# Use helper
instance.version # 0.38.0
instance.projects # [...]

# Use GraphQL Query
instance.query('{runtime{platform}}')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

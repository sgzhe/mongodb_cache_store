# MongodbCacheStore

A MongoDB cache store for ActiveSupport.

MongoDBCacheStore provider for the standard Rails 5.2 cache mechanism. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mongodb_cache_store'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongodb_cache_store

## Usage

You can set up your application's default cache store by setting the config.cache_store configuration option.

```ruby
config.cache_store = :mongo_db_cache_store, { db_uri: 'mongodb://127.0.0.1:27017/rails_cache_store' }
```

Or use mongoid as:

```ruby
config.cache_store = :mongo_id_cache_store
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mongodb_cache_store. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MongodbCacheStore project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/mongodb_cache_store/blob/master/CODE_OF_CONDUCT.md).

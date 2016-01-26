# TideScraper

TideScraper simple gem for scraping tidal predictons from the UKHO's EasyTide system.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tide_scraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tide_scraper

## Usage

Assuming id = a UKHO port ID as a string:

```
require 'tide_scraper'
scraper = TideScraper::Scraper.new
puts scraper.get_prediction(id)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/s3krit/tide_scraper.


## License

The gem is available as open source under the terms of the [GPL-3.0](http://opensource.org/licenses/GPL-3.0).


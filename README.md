# Tapirgo

A simple Ruby library for the [Tapir](http://tapirgo.com/) API.

## Installation

Add this line to your application's Gemfile:

    gem 'tapirgo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tapirgo

## Usage

### Searches

Create a `Tapirgo::Search` instance with your Tapir API token and desired
search string:

    search = Tapirgo::Search.new('XXXXXXXXXXXXXX', 'example')

Search results can be accessed individually or iterated over:

    first_result = search[0]
    search.each { |result| puts result }

Each result has methods for all the data returned by the Tapir API:

    result.title
    result.score
    result.link
    result.content
    result.summary
    result.published

For additional information, see the
[Tapir documentation](http://tapirgo.com/#docs).

## Contributing

1. Fork it ( http://github.com/RoboticCheese/tapirgo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Ensure all tests still pass and that your change is tested (`rake`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

# benfordslaw.cr

[![Build Status](https://travis-ci.org/CMiksche/benfordslaw.cr.svg?branch=master)](https://travis-ci.org/CMiksche/benfordslaw.cr)

A Crystal shard which provides a check if a number array confirms to the Benford's Law

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     benfordslaw:
       github: cmiksche/benfordslaw.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "benfordslaw"
```

Look at the tests for good examples. E.g.

```crystal
test = BenfordsLaw::Check.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
test.chiSquared.should eq(0.40105320411553363)
```

The BenfordsLaw::Check.chiSquared result is a float and describes how well Benford's Law was matched. Lower is better.

BenfordsLaw::Check.dist returns the distribution of the numbers 1 to 9 in the input array.

## Development

Run tests:

    crystal spec

Format:

    crystal tool format

## Contributing

1. Fork it (<https://github.com/CMiksche/benfordslaw.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Christoph Daniel Miksche](https://github.com/CMiksche) - creator and maintainer

## See also

* https://github.com/CMiksche/benford A Go Package implementation of this benford's law check
* https://github.com/CMiksche/benfordslaw A JavaScript / TypeScript npm Package implementation of this benford's law check
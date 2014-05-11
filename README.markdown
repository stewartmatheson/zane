# Zane

PhantomJS wrapped in Celluloid. Got a lot of pages to scrape? Want to light up those cores? If so then let Billy work his magic.

## Features

 * Core to PhantomJS mapping
 * Simple call back system for requests

## Examples

```ruby
require 'zane'

# Start zane will bring up one PhantomJS instance for each core on your machine
Zane.start!

# Now tell Billy to go to work. Rembmer that Zane will do all dispatching for you
# so send as many pages to the reactor as you like
Zane.visit('example.com') do |page|
  puts page.title
  puts page.html
end
```

## Requirements
 * Celluloid

## Install

```bash
$ gem install zane
```

## Copyright

Copyright (c) 2014 Stewart Matheson

See LICENSE.txt for details.

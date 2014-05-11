# Zane

PhantomJS wrapped in Celluloid. Got a lot of pages to scrape? Want to light up those cores? If so then let Billy work his magic. PhantomJS is a great tool for scraping the web. The only issue is that it does not scale all that well. From what I can tell it's designed around a single threaded model that allows for blocking style requests. Zane creates an instance of PhantomJS for each core of the machine it's running allowing all instances of PhantomJS to be used at the same time. This will great increase though put of any scraper type appliactions that have a large back log of pages to scrape.

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

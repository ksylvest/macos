# MacOS

[![LICENSE](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/ksylvest/macos/blob/main/LICENSE)
[![RubyGems](https://img.shields.io/gem/v/macos)](https://rubygems.org/gems/macos)
[![GitHub](https://img.shields.io/badge/github-repo-blue.svg)](https://github.com/ksylvest/macos)
[![Yard](https://img.shields.io/badge/docs-site-blue.svg)](https://macos.ksylvest.com)
[![CircleCI](https://img.shields.io/circleci/build/github/ksylvest/macos)](https://circleci.com/gh/ksylvest/macos)

A library for interacting with your Mac through ruby.

## Installation

```ruby
gem install macos
```

## Usage

### Mouse

```ruby
require 'macos'

mouse = MacOS.mouse

mouse.move(x: 0, y: 0)
position = mouse.position
puts "#{position.x},#{position.y}"

mouse.move(x: 2, y: 3)
position = mouse.position
puts "#{position.x},#{position.y}"
```

### Display

```ruby
require 'macos'

display = MacOS.display
bounds = display.bounds

puts "#{bounds.width}×#{bounds.height}"

display.screenshot do |tempfile|
  # ...
end
```

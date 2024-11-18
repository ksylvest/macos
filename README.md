# MacOS.rb

A library for interacting with your Mac through ruby.

## Installation

```ruby
gem install macos
```

## Usage

### Screen

```ruby
require 'macos'

screen = MacOS.screen
screen.capture do |tempfile|
  # ...
end
```

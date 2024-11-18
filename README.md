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

### Screen

```ruby
require 'macos'

screen = MacOS.screen
screen.capture do |tempfile|
  # ...
end
```

### Mouse

```ruby
require 'macos'

mouse = MacOS.mouse
mouse.move(x: 0, y: 0)
sleep 0.1
x, y = mouse.position
sleep 0.1
mouse.left_mouse_click(x:, y:)
mouse.right_mouse_click(x:, y:)
```

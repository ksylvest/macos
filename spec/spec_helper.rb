# frozen_string_literal: true

require 'simplecov'
require 'macos'

SimpleCov.start do
  enable_coverage :branch
end

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

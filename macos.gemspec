# frozen_string_literal: true

require_relative "lib/macos/version"

Gem::Specification.new do |spec|
  spec.name = "macos"
  spec.version = MacOS::VERSION
  spec.authors = ["Kevin Sylvestre"]
  spec.email = ["kevin@ksylvest.com"]

  spec.summary = "An interface with macOS."
  spec.description = "An interface (designed for LLMs) to macOS."
  spec.homepage = "https://github.com/ksylvest/macos"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/releases"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.glob("{bin,lib,exe}/**/*") + %w[README.md Gemfile]

  spec.require_paths = ["lib"]

  spec.add_dependency "ffi"
  spec.add_dependency "fiddle"
  spec.add_dependency "zeitwerk"
end

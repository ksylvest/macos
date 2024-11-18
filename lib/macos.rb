# frozen_string_literal: true

require 'fiddle'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect 'cg' => 'CG'
loader.inflector.inflect 'macos' => 'MacOS'
loader.setup

# Interacts with macOS.
module MacOS
  class Error < StandardError; end

  # @return [MacOS::Mouse]
  def self.mouse
    Mouse.new
  end

  # @return [MacOS::Screen]
  def self.screen
    Screen.new
  end
end

# frozen_string_literal: true

require "fiddle"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect "macos" => "MacOS"
loader.inflector.inflect "image_io" => "ImageIO"
loader.setup

# Interacts with macOS.
module MacOS
  class Error < StandardError; end

  # @example
  #   MacOS.keyboard.type('Hello, World!')
  #   MacOS.keyboard.key_down('a')
  #   MacOS.keyboard.key_up('a')
  #
  # @return [MacOS::Keyboard]
  def self.keyboard
    Keyboard.new
  end

  # @example
  #   mouse = MacOS.mouse
  #   mouse.move(x: 4, y: 8)
  #   position = mouse.position
  #   mouse.left_click(x: position.x, y: position.y)
  #   mouse.right_click(x: position.x, y: position.y)
  #
  # @return [MacOS::Mouse]
  def self.mouse
    Mouse.new
  end

  # @return [MacOS::Display]
  def self.display
    Display.main
  end
end

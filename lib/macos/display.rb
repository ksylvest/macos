# frozen_string_literal: true

module MacOS
  # Simulates a macOS display.
  class Display
    Size = Struct.new(:width, :height)

    def self.main
      id = Library.CGMainDisplayID
      new(id:)
    end

    # @param id [Integer
    def initialize(id:)
      @id = id
    end

    # @return [Size]
    def bounds
      bounds = Library.CGDisplayBounds(@id)

      width = Integer(bounds[:size][:width])
      height = Integer(bounds[:size][:height])

      Size.new(width, height)
    end

    # @yield [tempfile]
    # @yieldparam tempfile [Tempfile]
    def capture
      tempfile = Tempfile.new(["screenshot", ".png"])
      system("screencapture -o -x #{tempfile.path}")
      yield tempfile
    ensure
      tempfile.close
      tempfile.unlink
    end
  end
end

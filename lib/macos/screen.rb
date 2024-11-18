# frozen_string_literal: true

module MacOS
  # Simulates a macOS screen.
  class Screen
    # @yield [tempfile]
    # @yieldparam tempfile [Tempfile]
    def capture
      tempfile = Tempfile.new(['screenshot', '.png'])
      system("screencapture -o -x #{tempfile.path}")
      yield tempfile
    ensure
      tempfile.close
      tempfile.unlink
    end
  end
end

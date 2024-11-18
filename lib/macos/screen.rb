module MacOS
  module Screen
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

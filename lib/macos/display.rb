# frozen_string_literal: true

require "tempfile"

module MacOS
  # Simulates a macOS display.
  class Display
    Size = Struct.new(:width, :height)

    def self.main
      id = Library::CoreGraphics.CGMainDisplayID
      new(id:)
    end

    # @param id [Integer
    def initialize(id: 0)
      @id = id
    end

    # @return [Size]
    def bounds
      bounds = Library::CoreGraphics.CGDisplayBounds(@id)

      width = Integer(bounds[:size][:width])
      height = Integer(bounds[:size][:height])

      Size.new(width, height)
    end

    # @yield [file]
    # @yieldparam file [File]
    def screenshot(&)
      tempfile = Tempfile.new(["screenshot", ".png"])

      image = Library::CoreGraphics.CGDisplayCreateImage(@id)

      encoding = Library::CoreFoundation::ENCODING_UTF8
      path = Library::CoreFoundation.CFStringCreateWithCString(nil, tempfile.path, encoding)
      url = Library::CoreFoundation.CFURLCreateWithFileSystemPath(nil, path, 0, false)
      uti = Library::CoreFoundation.CFStringCreateWithCString(nil, "public.png", encoding)

      dest = Library::ImageIO.CGImageDestinationCreateWithURL(url, uti, 1, nil)
      Library::ImageIO.CGImageDestinationAddImage(dest, image, nil)
      Library::ImageIO.CGImageDestinationFinalize(dest)

      Library::CoreGraphics.CFRelease(image)
      Library::CoreFoundation.CFRelease(path)
      Library::CoreFoundation.CFRelease(url)
      Library::CoreFoundation.CFRelease(uti)
      Library::CoreFoundation.CFRelease(dest)

      File.open(tempfile.path, "rb", &)
    ensure
      tempfile.close
      tempfile.unlink
    end
  end
end

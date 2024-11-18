# frozen_string_literal: true

require "ffi"

module MacOS
  module Library
    # https://developer.apple.com/documentation/corefoundation
    module ImageIO
      extend FFI::Library
      ffi_lib "/System/Library/Frameworks/ImageIO.framework/ImageIO"

      attach_function :CGImageDestinationCreateWithURL, %i[pointer pointer size_t pointer], :pointer
      attach_function :CGImageDestinationAddImage, %i[pointer pointer pointer], :void
      attach_function :CGImageDestinationFinalize, %i[pointer], :bool
      attach_function :CFRelease, %i[pointer], :void
    end
  end
end
